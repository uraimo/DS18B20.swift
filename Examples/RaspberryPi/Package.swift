// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TestDS18B20",
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/uraimo/DS18B20.swift.git",from: "2.0.0")
    ],
    targets: [
        .target(name: "TestDS18B20", 
                dependencies: ["SwiftyGPIO","DS18B20"],
                path: "Sources")
    ]
) 