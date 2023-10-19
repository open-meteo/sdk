# Open-Meteo SDK Schema Files

The Open-Meteo weather API uses FlatBuffers to encode API responses efficiently. The compiled schema files for various programming languages can be found in this repository.

The biggest advantage of FlatBuffers is that large floating point arrays can be encoded directly instead of expensive transformation to JSON ASCII. Especially for historical weather data processing is significantly faster. But also for displaying a regular weather forecast on low-power devices, binary data encoding saves energy.

The FlatBuffers schema definition can be found in the [./flatbuffers](./flatbuffers) directory. Only non-breaking changes are accepted. Binary compatibility is ensured. Every change will be announced in new release following semantic versioning.

The compiled schema files do not contain any code to perform HTTP calls. They are intent to be used by developers to build client libraries.

More information on how to use the compiled schema files can be found in the directories for each programming language
- [Swift](./swift/)
- [Python](./python/)
- [TypeScript / JavaScript](./ts/)

Not all programming languages are supported yet. It is a time-intensive process to validate all languages. Please open a issue ticket to ask for an additional language and/or package distribution system.

## Usage
Open-Meteo offers various APIs. Each API endpoint is using different FlatBuffers schemas to encode its API response. This enables strict typing. E.g. The `Marine API` offers different variables like `wave height` or the `Ensemble API` returns multiple member forecasts for each variable. Per default, the Open-Meteo API returns JSON, but specifying `&format=flatbuffers` in the URL return FlatBuffers encoded data.

Depending on the programming language, you can use a HTTP client to fetch all data and decode the response according to each API endpoint. The following API response schema files are available. Each contains a `<Name>ApiResponse` structure:
- [WeatherApi](./flatbuffers/weather_api.fbs): Used for forecast and historical data
- [AirQualityApi](./flatbuffers/air_quality_api.fbs)
- [MarineApi](./flatbuffers/marine_api.fbs)
- [EnsembleApi](./flatbuffers/ensemble_api.fbs)
- [FloodApi](./flatbuffers/flood_api.fbs)
- [ClimateApi](./flatbuffers/climate_api.fbs)


### Size Prefixed FlatBuffers
Data can be requested for multiple locations and multiple weather models in one API calls. E.g. `&latitude=47.1,49.7&longitude=8.6,9.4`. To return multiple locations at once, multiple FlatBuffers messages are send.

To distinguish multiple messages, each message is prefixed by its length as a 32-bit integer (little endian). This is known as `size-prefixed`` FlatBuffer messages. Over the wire the messages look like this:
- Length: 4 byte, int32 (little endian) = 1284 byte
- Message: 1284 byte
- Length: 4 byte, int32 (little endian) = 1306 byte
- Message: 1306 byte
- ...

While decoding the response you can loop over data and process one after another. As a reference here is the [Python code](https://github.com/open-meteo/python-requests/blob/a7eeee86b12a9868fedcb9768efa3a5a1d8a80a6/openmeteo_requests/Client.py#L29).

Up to 1000 locations can be requested at once. The Open-Meteo API prefetches data for all locations, but will process one location after another and "stream" the response. Therefore is it possible to decode the first message, while the next messages are still being processed on the server. This can be useful to ingest large amount of data, but is a rather complex approach. For simplicity, waiting for the entire response and then start processing data works well too.

## Structure
Each response contains data for one location and one weather model. Fields include
- Latitude: Float
- Longitude: Float
- Elevation: Float
- Model: Enumeration
- Timezone: String
- Timezone abbreviation: String
- Utc offset seconds: Int32
- current: Object
- minutely_15: Object
- hourly: Object
- daily: Object

Depending on the API response type, `model`, `current`, `minutely_15`, `hourly` and `daily` use different types with different attributes.

### `minutely_15`, `hourly` and `daily`
Each section contains time information and all available weather variables. E.g. the Forecast API offers:
- time: TimeRange;
- temperature_2m:
- apparent_temperature: ValuesAndUnit;
- dewpoint_2m: ValuesAndUnit;
- ... and hundreds more

Time is encoded as `TimeRange` and contains start and end timestamps to create a time interval. Timestamps always use unixtime in seconds. Time is always in GMT! If you want to display local time again, you can use the attribute `utc_offset_seconds` from the response structure. `TimeRange` contains the fields:
- start: int64; The first timestamp in GMT
- end: int64; The last timestamp that is not included in the time-interval. Therefore one step after the last included timestep.
- interval: int32; The number of seconds for each step. For hourly data this is `3600 seconds` and for daily data `86400 seconds`.

Data for each weather variable uses `ValuesAndUnit` with attributes:
- values: [float]; Time-series for the given weather variable
- unit: SiUnit; The returned unit for this weather variable

Putting everything together the following Python code illustrates how to get the time-series and Temperature data from a response.
```python
hourly = result.Hourly()
time = hourly.Time()

timestamps = np.arange(time.Start(), time.End(), time.Interval())
temperature_2m = hourly.Temperature2m().ValuesAsNumpy()
```

### `Current`
Similar to `hourly` or `daily` data, current values use a structure that contains time and all weather variables:
- time: int64;
- interval: int32;
- apparent_temperature: ValueAndUnit;
- cloudcover: ValueAndUnit;
- ... many many more

The difference is that `time` is just a plain unixtimestamp instead of a time-interval. However it still contains an `interval` attribute which is required to know for which interval variables like precipitation are valid. E.g. The precipitation sum could be the some of 15 or 60 minutes.

`ValueAndUnit` is similar to `ValuesAndUnit`, but singular in this case and contains only a single value instead of an floating point array

### `model`
Each API response type defines all available models. E.g. `icon_eu` for the European ICON model from the German Weather Service. If data for multiple weather models is requested from the API, multiple size-prefixed FlatBuffer messages are returned. One per each model.

`model` is using an enumeration with a fixed list. Depending on the programming language you will have to decode the model to a useable string. E.g. Python

```python
from openmeteo_sdk import WeatherModel

def model_to_name(code):
    """convert WeatherModel to name"""
    for name, value in WeatherModel.WeatherModel.__dict__.items():
        if value == code:
            return name
    return None

print(result.Model()) # 1
print(model_to_name(result.Model())) # best_match
```

### Pressure level variables
Most weather variables are listed in the FlatBuffer schema directly. However, pressure level variables like `temperature_1000hPa` are encoded differently. Instead of listing each pressure level individually (over 500 variables), inside the `hourly` schema you will find:
- pressure_level_temperature: ValuesUnitPressureLevel;
- pressure_level_dewpoint: ValuesUnitPressureLevel;
- pressure_level_relativehumidity: ValuesUnitPressureLevel;
- pressure_level_cloudcover: ValuesUnitPressureLevel;
- and more

The the intermediate structure `ValuesUnitPressureLevel` contains data for all requested pressure levels. Fields are: 
- unit: SiUnit;
- values: [ValuesAndLevel];

And `ValuesAndLevel` contains:
- level: int32;
- values: [float] (required);

If multiple pressure level variables are requested, the following Python code illustrates how multiple levels can be accessed

```python
# Process all atmospheric levels
temperature = hourly.PressureLevelTemperature()
for i in range(0, temperature.ValuesLength()):
	level = temperature.Values(i).Level()
	data[f"temperature_2m_{level}hPa"] = temperature.Values(i).ValuesAsNumpy()
```

### Ensemble forecasts
Analog to pressure level variables, all ensemble forecasts use the same additional layer. The only difference: `level` is called `member`.

```python
# Process all members
temperature_2m = hourly.Temperature2m()
for i in range(0, temperature_2m.ValuesLength()):
	member = temperature_2m.Values(i).Member()
	data[f"temperature_2m_member{member}"] = temperature_2m.Values(i).ValuesAsNumpy()
```

# License
MIT