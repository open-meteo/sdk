# Open-Meteo Swift SDK

Add `OpenMeteoSdk` as a dependency to your `Package.swift`

```swift
  dependencies: [
    .package(url: "https://github.com/open-meteo/sdk.git", from: "1.0.0")
  ],
  targets: [
    .target(name: "MyApp", dependencies: [
      .product(name: "OpenMeteoSdk", package: "sdk"),
    ])
  ]
```


## Usage

Fetch hourly weather data and decode

```swift
import OpenMeteoSdk

let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52,40.1&longitude=13.41,8.1&hourly=temperature_2m&format=flatbuffers")!

let responses = try await OpenMeteoSdk.fetchWeatherApi(url: url)
let response = responses[0]
...
```


Decode `Data` to an array of `WeatherApiResponse`

```swift
import OpenMeteoSdk

let data = ...
let responses = WeatherApiResponse.from(data: data)
```


