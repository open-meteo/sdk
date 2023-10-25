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
Open-Meteo offers various APIs. Each API endpoint is using different FlatBuffers schemas to encode its API response. This enables strict typing. E.g. Weather data APIs offer offers different variables while the Geocoding API returns a different structure. Per default, the Open-Meteo API returns JSON, but specifying `&format=flatbuffers` in the URL return FlatBuffers encoded data.

Depending on the programming language, you can use a HTTP client to fetch all data and decode the response according to each API endpoint. The following API response schema files are available:
- [Weather, Marine, Ensemble, Flood and Climate API](./flatbuffers/openmeteo_sdk.fbs): Used for forecast and historical data
- Elevation API: Not yet available
- Geocoding API: Not yet available


## Structure
Each response contains data for one location and one weather model. If multiple locations are requested, multiple ApiResponses will be returned as an array using `size-prefixed` encoding (see below).

### ApiResponse
The main `ApiResponse` structure contains
- `latitude` & `longitude` float: Coordinate of the weather model grid-cell
- `elevation` float: Terrain elevation of the requested coordinates
- `generation_time_milliseconds` float
- `location_id` int64: Identifier of a location
- `model` [Model](#Model): Name of weather model as an enumeration
- `utc_offset_seconds` int32: Timezone offset from GMT time in seconds. e.g. `3600`
- `timezone` string: Timezone name like `Europe/Berlin`
- `timezone_abbreviation` string: Abbreviation like `CET`
- `current` [SeriesAndTime](#SeriesAndTime): All variables requested with `&current=`
- `daily` [SeriesAndTime](#SeriesAndTime): All variables requested with `&daily=`
- `hourly` [SeriesAndTime](#SeriesAndTime): All variables requested with `&hourly=`
- `minutely_15` [SeriesAndTime](#SeriesAndTime): All variables requested with `&minutely_15=`
- `six_hourly` [SeriesAndTime](#SeriesAndTime): All variables requested with `&six_hourly=`

### SeriesAndTime
All `hourly` or `daily` weather variables are grouped into the class `SeriesAndTime`. It contains the start and end time as well as the interval.

Attributes:
- `start` int64: Unix timestamp of the first value in GMT
- `end` int64: The last timestamp that is not included in the time-interval. Therefore one step after the last included timestep.
- `interval` int32:  The number of seconds for each step. For hourly data this is `3600 seconds` and for daily data `86400 seconds`.
- `series` [[Series](#Series)]: An array of weather variables

Timestamps always use unixtime in seconds. Time is always in GMT! If you want to display local time again, you can use the attribute `utc_offset_seconds` from the response structure

### Series
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

hourly = response.Hourly()
hourly_series = map(lambda i: hourly.Series(i), range(0, hourly.SeriesLength()))

temperature_2m = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2, hourly_series))
precipitation = next(filter(lambda x: x.Variable() == Variable.precipitation, hourly_series))

print(temperature_2m.ValuesAsNumpy())
print(precipitation.ValuesAsNumpy())
```

Depending on the variable, you only have to filter by the variable name. Filtering by `altitude` is relevant if you select wind speed on multiple heights e.g. `wind_speed_10m` and `wind_speed_80m`. 

If you select different daily aggregations, make sure to also check for the correct aggregation. Example:

```python
from openmeteo_sdk.Variable import Variable
from openmeteo_sdk.Aggregation import Aggregation

daily = response.Daily()
daily_series = map(lambda i: daily.Series(i), range(0, daily.SeriesLength()))

temperature_2m_max = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2 and x.Aggregation() == Aggregation.maximum, daily_series))
temperature_2m_min = next(filter(lambda x: x.Variable() == Variable.temperature and x.Altitude() == 2 and x.Aggregation() == Aggregation.minimum, daily_series))

print(temperature_2m_max.ValuesAsNumpy())
print(temperature_2m_min.ValuesAsNumpy())
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

# License
MIT