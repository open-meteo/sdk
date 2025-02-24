// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "OpenMeteoSdk",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "OpenMeteoSdk",
            targets: ["OpenMeteoSdk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/flatbuffers.git", exact: "25.2.10")
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
