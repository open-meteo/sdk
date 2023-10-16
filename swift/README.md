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