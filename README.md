# DS18B20.swift

*A Swift library for the DS18B20 Digital temperature sensor*

<p>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux-only" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat" alt="Swift 4 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/DS18B20.swift/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
 
![DS18B20](https://github.com/uraimo/DS18B20.swift/raw/master/ds18b20.png)

# Summary

This is a library for the DS18B20 temperature sensor, available in various forms, from classic ICs to waterproof probes. 

The sensor uses the 1-Wire protocol to communicate.

## Hardware Details

The sensor can be powered using 3.3V and the signal pin will need a pull-up resistor of 4.7KΩ connected to the same voltage.

The 1-Wire port on the RaspberryPi needs to be enabled via `raspi-config` before you can use it (restart required), and enabling 1-Wire you'll lose the ability to use the pin as a standard GPIO.

## Usage

The temperature returned by the sensor is provided by the only property of the `DS18B20` object: `Temperature`.

The value is in Celsius degrees, if you need a value in Fahrenheit a manual conversion will be necessary.

As for other libraries, to initialize this object you need to retrieve first a `OneWireInterface` instance from SwiftyGPIO and then initialize the DS18B20 sensor providing a slave id:

```swift
let onewires = SwiftyGPIO.hardware1Wires(for:.RaspberryPi2)!
let onewire = onewires[1]

let slaveId = onewire.getSlaves()[0]

let ds = DS18B20(onewire,slaveId: slaveId)

print(ds.Temperature())
```

The slave id is unique and identifies a specific sensor, since more than one could be connected to the same 1-Wire bus.

In most cases you'll just hardcode the slave id you want, instead of selecting one from the list of available slave devices that could sometime return items in a different order.

## Supported Boards

Every board supported by [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO): RaspberryPis, BeagleBones, C.H.I.P., etc...

To use this library, you'll need a Linux ARM board with Swift 3.x/4.x.

The example below will use a RaspberryPi 2 board but you can easily modify the example to use one the other supported boards, a full working demo projects for the RaspberryPi2 is available in the `Examples` directory.


## Installation

Please refer to the [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO) readme for Swift installation instructions.

Once your board runs Swift, if your version support the Swift Package Manager, you can simply add this library as a dependency of your project and compile with `swift build`:

```swift
  let package = Package(
      name: "MyProject",
      dependencies: [
        .Package(url: "https://github.com/uraimo/DS18B20.swift.git", majorVersion: 2),
      ]
  ) 
```

The directory `Examples` contains sample projects that uses SPM, compile it and run the sample with `./.build/debug/TestDS18B20`.

If SPM is not supported, you'll need to manually download the library and its dependencies: 

    wget https://raw.githubusercontent.com/uraimo/DS18B20.swift/master/Sources/DS18B20.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SwiftyGPIO.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/Presets.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SunXi.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/1Wire.swift 

And once all the files have been downloaded, create an additional file that will contain the code of your application (e.g. main.swift). When your code is ready, compile it with:

    swiftc *.swift

The compiler will create a **main** executable.


