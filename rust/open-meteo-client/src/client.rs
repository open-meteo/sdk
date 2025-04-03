use crate::error::OpenMeteoSdkError;
use open_meteo_sdk::{size_prefixed_root_as_weather_api_response, WeatherApiResponse};
use serde::Deserialize;

#[derive(Deserialize)]
pub(crate) struct ErrorResponse {
    #[allow(dead_code)]
    pub(crate) error: bool,
    pub(crate) reason: String,
}

/// Container that owns the buffer data and provides WeatherApiResponse objects
pub struct WeatherData {
    buffer: Vec<u8>,
}

impl WeatherData {
    pub fn from_buffer(buffer: Vec<u8>) -> Self {
        Self { buffer }
    }

    /// Parse multiple size-prefixed flatbuffer messages from the owned buffer
    pub fn get_responses(&self) -> Result<Vec<WeatherApiResponse>, OpenMeteoSdkError> {
        let mut results = Vec::new();
        let mut position: usize = 0;
        let buf = self.buffer.as_slice();

        while position + 4 <= buf.len() {
            let length_bytes = &buf[position..position + 4];
            let length = u32::from_le_bytes([
                length_bytes[0],
                length_bytes[1],
                length_bytes[2],
                length_bytes[3],
            ]) as usize;

            let end_position = position + 4 + length;

            if end_position > buf.len() {
                break;
            }

            let response = size_prefixed_root_as_weather_api_response(&buf[position..end_position]);

            match response {
                Ok(response) => {
                    results.push(response);
                }
                Err(error) => {
                    return Err(OpenMeteoSdkError::InvalidResponse {
                        message: error.to_string(),
                    });
                }
            }

            // Move to the next message
            position = end_position;
        }

        Ok(results)
    }
}

pub struct OpenMeteoClient {
    client: reqwest::blocking::Client,
}

impl OpenMeteoClient {
    /// Create a new client with default configuration
    pub fn new() -> Self {
        Self {
            client: reqwest::blocking::Client::new(),
        }
    }

    /// Create a new client with custom configuration
    pub fn with_client(client: reqwest::blocking::Client) -> Self {
        Self { client }
    }

    /// Fetch weather data from Open-Meteo API
    pub fn fetch(&self, url: &str) -> Result<WeatherData, OpenMeteoSdkError> {
        let response = self.client.get(url).send()?;

        let status_code = response.status().as_u16();
        let body = response.bytes()?;

        // If we get an error status code, try to parse the error message
        if status_code == 400 || status_code == 429 {
            let error_response: ErrorResponse = serde_json::from_slice(&body)?;
            return Err(OpenMeteoSdkError::ApiError {
                message: error_response.reason,
            });
        }

        if status_code != 200 {
            return Err(OpenMeteoSdkError::ServerError { status_code });
        }

        // This code is using the optimized `impl From<Bytes> for Vec<u8> `
        Ok(WeatherData::from_buffer(body.into()))
    }
}
