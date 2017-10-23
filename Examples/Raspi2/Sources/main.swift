import SwiftyGPIO
import DS18B20
import Foundation

let onewires = SwiftyGPIO.hardware1Wires(for:.RaspberryPi2)!
let onewire = onewires[0]

let slaveId = onewire.getSlaves()[0]

let ds = DS18B20(onewire,slaveId: slaveId)

print(ds.Temperature())

