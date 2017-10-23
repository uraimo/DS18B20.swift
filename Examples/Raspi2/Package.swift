import PackageDescription

let package = Package(
    name: "TestDS18B20",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/uraimo/DS18B20.swift.git",
                 majorVersion: 1)
    ]
)
