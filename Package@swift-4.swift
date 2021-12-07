// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DS18B20",
    products: [
        .library(
            name: "DS18B20",
            targets: ["DS18B20"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "DS18B20",
            dependencies: ["SwiftyGPIO"],
            path: ".",
            sources: ["Sources"])
    ]
)