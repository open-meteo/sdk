# Open-Meteo SDK Schema Files

[![Test](https://github.com/open-meteo/sdk/actions/workflows/test.yml/badge.svg)](https://github.com/open-meteo/sdk/actions/workflows/test.yml) [![GitHub version](https://badge.fury.io/gh/open-meteo%2Fsdk.svg)](https://badge.fury.io/gh/open-meteo%2Fsdk) [![npm version](https://badge.fury.io/js/@openmeteo%2Fsdk.svg)](https://www.npmjs.com/package/@openmeteo/sdk) [![PyPI version](https://badge.fury.io/py/openmeteo-sdk.svg)](https://pypi.org/project/openmeteo-sdk/)

The Open-Meteo weather API uses FlatBuffers to encode API responses efficiently. The compiled schema files for various programming languages can be found in this repository.

The biggest advantage of FlatBuffers is that large floating point arrays can be encoded directly instead of expensive transformation to JSON ASCII. Especially for historical weather data processing is significantly faster. But also for displaying a regular weather forecast on low-power devices, binary data encoding saves energy.

The FlatBuffers schema definition can be found in the [./flatbuffers](./flatbuffers) directory. Only non-breaking changes are accepted. Binary compatibility is ensured. Every change will be announced in new release following semantic versioning.

The compiled schema files do not contain any code to perform HTTP calls. They are intent to be used by developers to build client libraries.

More information on how to use the compiled schema files can be found in the directories for each programming language
- [Swift](./swift/) via Swift Package Manager
- [Python](./python/) via PIP
- [TypeScript / JavaScript](./ts/) via NPM
- [Java](./java/) via Maven Central
- [C#](./csharp/openmeteo_sdk/)

Not all programming languages are supported yet. It is a time-intensive process to validate all languages. Please open a issue ticket to ask for an additional language and/or package distribution system.

## Usage
Open-Meteo offers various APIs. Each API endpoint is using different FlatBuffers schemas to encode its API response. This enables strict typing. E.g. Weather data APIs offer offers different variables while the Geocoding API returns a different structure. Per default, the Open-Meteo API returns JSON, but specifying `&format=flatbuffers` in the URL return FlatBuffers encoded data.

Depending on the programming language, you can use a HTTP client to fetch all data and decode the response according to each API endpoint. The following API response schema files are available:
- [Weather, Marine, Ensemble, Flood and Climate API](./flatbuffers/weather_api.fbs): Used for forecast and historical data
- Elevation API: Not yet available
- Geocoding API: Not yet available


## Structure
Each response contains data for one location and one weather model. If multiple locations are requested, multiple ApiResponses will be returned as an array using `size-prefixed` encoding (see below).

### WeatherApiResponse
The main `WeatherApiResponse` structure contains
- `latitude` & `longitude` float: Coordinate of the weather model grid-cell
- `elevation` float: Terrain elevation of the requested coordinates
- `generation_time_milliseconds` float
- `location_id` int64: Identifier of a location
- `model` [Model](#Model): Name of weather model as an enumeration
- `utc_offset_seconds` int32: Timezone offset from GMT time in seconds. e.g. `3600`
- `timezone` string: Timezone name like `Europe/Berlin`
- `timezone_abbreviation` string: Abbreviation like `CET`
- `current` [VariablesWithTime](#VariablesWithTime): All variables requested with `&current=`
- `daily` [VariablesWithTime](#VariablesWithTime): All variables requested with `&daily=`
- `hourly` [VariablesWithTime](#VariablesWithTime): All variables requested with `&hourly=`
- `minutely_15` [VariablesWithTime](#VariablesWithTime): All variables requested with `&minutely_15=`
- `six_hourly` [VariablesWithTime](#VariablesWithTime): All variables requested with `&six_hourly=`

### VariablesWithTime
All `hourly` or `daily` weather variables are grouped into the class `VariablesWithTime`. It contains the start and end time as well as the interval.

Attributes:
- `start` int64: Unix timestamp of the first value in GMT
- `end` int64: The last timestamp that is not included in the time-interval. Therefore one step after the last included timestep.
- `interval` int32:  The number of seconds for each step. For hourly data this is `3600 seconds` and for daily data `86400 seconds`.
- `variables` [[VariableWithValues](#VariableWithValues)]: An array of weather variables

Timestamps always use unixtime in seconds. Time is always in GMT! If you want to display local time again, you can use the attribute `utc_offset_seconds` from the response structure

### VariableWithValues
Each weather variable is accompanied by meta data like the name of the weather variable or unit.

Attributes:
- `variable` [Variable](#Variable): An enumeration of the weather variable. E.g. `temperature`
- `unit` [Unit](#Unit): Which unit is used for the result. E.g. `celsius`
- `value` float: For `current` values, data is stored in this field
- `values` [float]: Any other time-series data is stored as a floating point array here
- `values_int64` [int64]: The variables `sunrise` and `sunset` use this field to store data as unix timestamp
- `altitude` int16: The altitude of the given variable. E.g `2` for temperature on 2 meters or `10` for wind speed on 10 meters
- `aggregation` [Aggregation](#Aggregation): The kind of aggregation for daily variables like `minimum`, `mean` or `maximum`
- `pressure_level` int16: If a weather variable in the upper atmosphere is requested, this field contains the pressure level in hectopascal. E.g. `850` for 850 hPa.
- `depth` int16: For soil variables this defined the upper limit. E.g. `7` in `soil_moisture_7_to_28`
- `depth_to` int16: The lower limit. E.g. `28` in `soil_moisture_7_to_28`
- `ensemble_member` int16: For ensemble data, the member of each ensemble is set here. `0` is mostly the control run. 


### Model
The `Model` enumeration contains all available models like `icon_global` or `best_match`.

Depending on the programming language you will have to decode the model to a useable string. E.g. for Python

```python
from openmeteo_sdk import Model

def model_to_name(code):
    """convert Model to name"""
    for name, value in Model.Model.__dict__.items():
        if value == code:
            return name
    return None

print(response.Model()) # 1
print(model_to_name(result.Model())) # "best_match"
```

### Variable
The `Variable` enumeration contains all available variables like `temperature` or `wind_speed`. Please note that the altitude is not included in the variable name. `temperature_2m` is encoded as `variable=temperature` and `altitude=2`.

### Unit
The `Unit` enumeration contains all available units like `celsius` or `metre_per_second`.

### Aggregation
The `Aggregation` enumeration contains all aggregations for daily variables like `minimum` or `maximum`.


## Selecting a single variable
Multiple weather variables are encoded as a list. If you want to access a single variable, you will have to loop over the array and filter by variable name and altitude. Here is an example to get `temperature_2m` and `precipitation`.

```python
from openmeteo_sdk.Variable import Variable
response = ...

hourly = response.Hourly()
hourly_variables = list(map(lambda i: hourly.Variables(i), range(0, hourly.VariablesLength())))

temperature_2m = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2, hourly_variables))
precipitation = next(filter(lambda x: x.Variable() == Variable.precipitation, hourly_variables))

print(temperature_2m.ValuesAsNumpy())
print(precipitation.ValuesAsNumpy())
```

Depending on the variable, you only have to filter by the variable name. Filtering by `altitude` is relevant if you select wind speed on multiple heights e.g. `wind_speed_10m` and `wind_speed_80m`. 

If you select different daily aggregations, make sure to also check for the correct aggregation. Example:

```python
from openmeteo_sdk.Variable import Variable
from openmeteo_sdk.Aggregation import Aggregation

daily = response.Daily()
daily_variables = list(map(lambda i: daily.Variables(i), range(0, daily.VariablesLength())))

temperature_2m_max = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2 and x.Aggregation() == Aggregation.maximum, daily_variables))
temperature_2m_min = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2 and x.Aggregation() == Aggregation.minimum, daily_variables))

print(temperature_2m_max.ValuesAsNumpy())
print(temperature_2m_min.ValuesAsNumpy())
```

The order of requested variables will be preserved. E.g. `&current=temperature_2m,wind_speed_10m,weather_code` will stay exactly in this order. Therefore you could just use indices. Note: `current` only returns one variable encoded into the field `value`.

```python
current = response.Current()
timestamp = current.start()
temperature_2m = current.Variables(0).value()
wind_speed_10m = current.Variables(1).value()
weather_code = current.Variables(2).value()
```

## Encoding with Size Prefixed FlatBuffers

Data can be requested for multiple locations and multiple weather models in one API calls. E.g. `&latitude=47.1,49.7&longitude=8.6,9.4`. To return multiple locations at once, multiple FlatBuffers messages are send.

To distinguish multiple messages, each message is prefixed by its length as a 32-bit integer (little endian). This is known as `size-prefixed` FlatBuffer messages. Over the wire the messages look like this:
- Length: 4 byte, int32 (little endian) = 1284 byte
- Message: 1284 byte
- Length: 4 byte, int32 (little endian) = 1306 byte
- Message: 1306 byte
- ...

While decoding the response you can loop over data and process one after another. As a reference here is the [Python code](https://github.com/open-meteo/python-requests/blob/a7eeee86b12a9868fedcb9768efa3a5a1d8a80a6/openmeteo_requests/Client.py#L29).

Up to 1000 locations can be requested at once. The Open-Meteo API prefetches data for all locations, but will process one location after another and "stream" the response. Therefore is it possible to decode the first message, while the next messages are still being processed on the server. This can be useful to ingest large amount of data, but is a rather complex approach. For simplicity, waiting for the entire response and then start processing data works well too.


## Convert API Response to JSON

If you would like to examine the data returned by the Open-Meteo API in binary FlatBuffers format, you can use the FlatBuffers schema compiler `flatc`. This can help to understand how the API response is structured. 

First, you will have to install the FlatBuffers compile. Mac: `brew install flatbuffers`. Ubuntu `sudo apt install flatbuffers-compiler`.

Get [`weather_api.fbs`](./flatbuffers/weather_api.fbs) from this repository. 

```bash
# Make sure the URL contains `&format=flatbuffers`
wget -O data.bin https://api.open-meteo.com/v1/forecast\?latitude\=52.52\&longitude\=13.41\&daily\=weather_code,temperature_2m_max,temperature_2m_min\&timezone\=auto\&format\=flatbuffers

flatc --json --size-prefixed --raw-binary weather_api.fbs -- data.bin
cat data.json
```

```javascript
{
  latitude: 52.52,
  longitude: 13.419998,
  elevation: 38.0,
  generation_time_milliseconds: 0.247002,
  model: "best_match",
  utc_offset_seconds: 3600,
  timezone: "Europe/Berlin",
  timezone_abbreviation: "CET",
  daily: {
    time: 1698620400,
    time_end: 1699225200,
    interval: 86400,
    variables: [
      {
        variable: "weather_code",
        unit: "wmo_code",
        values: [
          3.0,
          80.0,
          3.0,
          61.0,
          61.0,
          61.0,
          61.0
        ]
      },
      {
        variable: "temperature",
        unit: "celsius",
        values: [
          14.8455,
          12.7955,
          14.0455,
          13.938999,
          12.389,
          12.3695,
          14.4695
        ],
        altitude: 2,
        aggregation: "maximum"
      },
      {
        variable: "temperature",
        unit: "celsius",
        values: [
          11.1455,
          8.1455,
          7.4955,
          8.488999,
          8.188999,
          6.389,
          9.0195
        ],
        altitude: 2,
        aggregation: "minimum"
      }
    ]
  }
}
```

Note: The values for `model`, `variable`, `unit` and `aggregation` are encoded into enumerations which use integers instead of strings. Only `timezone` and `timezone_abbreviation` are actual strings that are encoded in the binary API response.

# License
MIT