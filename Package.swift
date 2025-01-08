// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "OpenMeteoSdk",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_14),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "OpenMeteoSdk",
            targets: ["OpenMeteoSdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/flatbuffers.git", exact: "24.12.23")
    ],
    targets: [
        .target(
            name: "OpenMeteoSdk",
            dependencies: [
                .product(name: "FlatBuffers", package: "flatbuffers")
            ],
            path: "swift/Sources"),
        .testTarget(
            name: "OpenMeteoSdkTests",
            dependencies: ["OpenMeteoSdk"],
            path: "swift/Tests"),
    ]
)
