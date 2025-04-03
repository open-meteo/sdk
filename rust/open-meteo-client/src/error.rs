use thiserror::Error;

#[derive(Error, Debug)]
pub enum OpenMeteoSdkError {
    #[error("API error: {message}")]
    ApiError { message: String },

    #[error("Server error: status {status_code}")]
    ServerError { status_code: u16 },

    #[error("HTTP request error: {0}")]
    HttpError(#[from] reqwest::Error),

    #[error("JSON error: {0}")]
    JsonError(#[from] serde_json::Error),

    #[error("Invalid response: {message}")]
    InvalidResponse { message: String },
}
