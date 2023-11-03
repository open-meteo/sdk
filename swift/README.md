# Open-Meteo Swift SDK

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


