# Open-Meteo Swift SDK

The Open-Meteo Swift SDK is your go-to tool for seamlessly integrating weather data into your Swift applications. It leverages the power of binary encoded FlatBuffer messages to swiftly transmit data from the [Open-Meteo API](https://open-meteo.com) to your client. This innovative approach eliminates the need for resource-intensive parsing, delivering a substantial speed boost to any app that relies on weather data.

Features:
- Fast and straightforward access to weather data
- Significantly reduced bandwidth usage and zero parsing overhead, thanks to the efficiency of FlatBuffers
- Compatibility with Swift's async paradigm and user-friendly helper functions for effortlessly fetching data, for example: `try await WeatherApiResponse.fetch(url: url)`


## Install

Add `OpenMeteoSdk` as a dependency to your `Package.swift`

```swift
  dependencies: [
    .package(url: "https://github.com/open-meteo/sdk.git", from: "1.5.0")
  ],
  targets: [
    .target(name: "MyApp", dependencies: [
      .product(name: "OpenMeteoSdk", package: "sdk"),
    ])
  ]
```


## Usage

Fetch weather data and form a `WeatherData` structure that can be later used.

Caveats:

- The provided example adds `response.utcOffsetSeconds` to all `Date()` timestamps. If a timestamp is formatted as a string with `dateFormatter.timeZone = .gmt`, it will display a local timestamp based on the location's timezone. The device's timezone setting is not taken into account. However, it's important to note that this method only considers the current UTC offset, so it doesn't account for changes in daylight saving time (DST) within the 7-day forecast period.

- It's crucial to maintain consistency in the order of weather variables in the URL query and the corresponding `at` indices. For instance, if you request `&hourly=temperature_2m,weather_code` temperature will be at index zero (`hourly.variables(at: 0)`), and weather_code will be at index one (`hourly.variables(at: 1)`).

- Hourly and daily data are organized as floating-point arrays with values for each hour or day. Other weather APIs may structure each day and hour as individual objects. While working with floating-point arrays might be less intuitive, it is more efficient when dealing with longer time-series data.


```swift
import OpenMeteoSdk

let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.521&longitude=13.41&current=temperature_2m,weather_code&hourly=temperature_2m,precipitation&daily=temperature_2m_min,temperature_2m_max&timezone=auto&format=flatbuffers")!
let responses = try await WeatherApiResponse.fetch(url: url)

/// Process first location. Add a for-loop for multiple locations or weather models
let response = responses[0]

/// Attributes for timezone and location
let utcOffsetSeconds = response.utcOffsetSeconds
let timezone = response.timezone
let timezoneAbbreviation = response.timezoneAbbreviation
let latitude = response.latitude
let longitude = response.longitude

let current = response.current!
let hourly = response.hourly!
let daily = response.daily!

struct WeatherData {
  let current: Current
  let hourly: Hourly
  let daily: Daily
  
  struct Current {
    let time: Date
    let temperature2m: Float
    let weatherCode: Float
  }
  struct Hourly {
    let time: [Date]
    let temperature2m: [Float]
    let precipitation: [Float]
  }
  struct Daily {
    let time: [Date]
    let temperature2mMax: [Float]
    let temperature2mMin: [Float]
  }
}

/// Note: The order of weather variables in the URL query and the `at` indices below need to match!
let data = WeatherData(
  current: .init (
    time: Date(timeIntervalSince1970: TimeInterval(current.time + Int64(utcOffsetSeconds))),
    temperature2m: current.variables(at: 0)!.value,
    weatherCode: current.variables(at: 1)!.value
  ),
  hourly: .init(
    time: hourly.getDateTime(offset: utcOffsetSeconds),
    temperature2m: hourly.variables(at: 0)!.values,
    precipitation: hourly.variables(at: 1)!.values
  ),
  daily: .init(
    time: daily.getDateTime(offset: utcOffsetSeconds),
    temperature2mMax: daily.variables(at: 0)!.values,
    temperature2mMin: daily.variables(at: 1)!.values
  )
)

/// Timezone `gmt` is deliberately used. 
/// By adding `utcOffsetSeconds` before, local-time is inferred
let dateFormatter = DateFormatter()
dateFormatter.timeZone = .gmt
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

for (i, date) in data.hourly.time.enumerated() {
  print(dateFormatter.string(from: date))
  print(data.hourly.temperature2m[i])
  print(data.hourly.precipitation[i])
}

for (i, date) in data.daily.time.enumerated() {
  print(dateFormatter.string(from: date))
  print(data.daily.temperature2mMin[i])
  print(data.daily.temperature2mMax[i])
}
```


`WeatherApiResponse.fetch` is not available on Linux, but you can decode `Data` to an array of `WeatherApiResponse`.

```swift
import OpenMeteoSdk

let data = ...
let responses = WeatherApiResponse.from(data: data)

// OR Validate HTTP status code and decode potenial errors
// data may contain `{error:true, reason: "Latitude out of range"}`
let data = ...
let statusCpde = 400
let responses = try WeatherApiResponse.from(data: data, statusCode: statusCode)
```

### How is Response Data Structured?

The Open-Meteo Weather API provides data in the form of FlatBuffer encoded messages. You can find the original FlatBuffers schema [here](../flatbuffers/weather_api.fbs).

To provide a clearer understanding of how each message is encoded, the following structures offer a fundamental overview.

The API delivers an array of `WeatherApiResponse` objects. In most scenarios, this array will consist of a single element. However, if you intend to request data for multiple locations or from various weather models within a single API call, you will receive multiple elements.

```swift
struct WeatherApiResponse {
  let latitude: Float32
  let longitude: Float32
  let elevation: Float32
  let model: openmeteo_sdk_Model = .undefined

  let timezone: String?
  let timezoneAbbreviation: String?
  let utcOffsetSeconds: Int32 = 0

  let current: VariablesWithTime?
  let daily: VariablesWithTime?
  let hourly: VariablesWithTime?
  let minutely15: VariablesWithTime?
  let sixHourly: VariablesWithTime?
}
```

Attributes:

- `latitude`, `longitude`, and `elevation` represent the central position of the grid-cell used by the weather models. They may not be identical to the coordinates specified in the URL parameters. Typically, they should fall within a range of 1 to 10 kilometers from the requested coordinates.
- `model` indicates the name of the weather model employed. By default, it's set to `.best_match`.
- `timezone`, `timezoneAbbreviation`, and `utcOffsetSeconds` provide information about the chosen timezone. When the API uses GMT by default, these fields will be empty. However, if you include the URL parameter `&timezone=auto`, these fields will be populated with the timezone identifier (e.g., `Europe/Berlin`), abbreviations (e.g., `CEST`), and the UTC offset in seconds (e.g., 1). The UTC offset in seconds can be helpful for converting timestamps to local time.
- `current`, `hourly`, `daily`, and others will be defined if the corresponding URL parameters (e.g., `&hourly=...`) are specified. Each of these will be encoded as an object of type `VariablesWithTime` (see below).

```swift
struct VariablesWithTime {
  let time: Int64
  let timeEnd: Int64
  let interval: Int32
  let variables: [VariableWithValues]

  func getDateTime(offset: Int32 = 0) -> [Date]
}
```

Attributes:

- `time`, `timeEnd`, and `interval` define the time interval for hourly or daily data. `time` and `timeEnd` are expressed as Unix timestamps, and interval is configured to be `3600 (60*60)` for hourly data and `86400 (24*60*60)` for daily data. You can create a time interval using a stride like `stride(from: time, to: timeEnd, by: interval)`. A handy function, `getDateTime(offset: Int32 = 0)`, is available for this purpose, which produces an array of Date values. You also have the option to set an optional `offset` for formatting dates in local time at a later stage.
- When you request weather variables in the URL, such as `&hourly=var0,var1,var2,...`, the `variables` array will contain each of the specified weather variables. The structure `VariableWithValues` is explained in more detail in the following section.

```swift
struct VariableWithValues {
  let variable: Variable
  let unit: Unit

  let value: Float // Only used for current conditions
  let values: [Float]? // Contains a time series of data
  let valuesInt64: [Int64]?  // Only for sunrise/set as a unix timestamp

  let altitude: Int16
  let aggregation: Aggregation
  let pressureLevel: Int16
  let depth: Int16
  let depthTo: Int16
  let ensembleMember: Int16
}
```

Attributes:

- `variable` is an enumeration comprising cases like `.temperature` or `.precipitation`. While earlier examples demonstrate straightforward access to weather variables using an index, such as `variables(at: 0)`, you can also iterate through all variables and filter for specific ones like `.temperature`.
- The `unit` attribute provides the unit for the weather variable depending on the variable and units selected in the URL. For instance, it might return `.celsius`.
- `value`, `values`, and `valuesInt64` contain the actual data. For current weather variables, the value field is filled with a single `Float` value. However, for time-interval data like daily information, a `Float-Array` is returned with values for each day.
- `aggregation` is utilized for daily data to denote whether it represents daily `maximum` or `minimum` values.
- `altitude` indicates the elevation above ground in meters. Normally, temperature is measured at 2 meters above the ground, but the API also offers additional levels such as `80`, `120`, or `180` meters.
- `pressureLevel`, similar to `altitude`, allows access to atmospheric levels specified in pressure levels like `850 hPa`. When dealing with multiple pressure levels, the `pressureLevel` attribute facilitates their use.
- `depth` and `depthTo` are employed for variables like `soil_moisture_0_to_100cm`. In this scenario, `variable` would be `.soil_moisture`, `depth` set to `0`, and `depthTo` set to `100`.
- For the ensemble weather API, which provides up to 51 members for each weather variable, `ensembleMember` is used to identify each member.
