// swift-tools-version:5.0
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
            exclude: ["Examples","ds18b20.png","README.md","LICENSE"],
            sources: ["Sources"])
    ]
)
