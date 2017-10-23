import PackageDescription

let package = Package(
    name: "DS18B20",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git",
                 majorVersion: 0)
    ]
)
