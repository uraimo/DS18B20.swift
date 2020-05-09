/*
   DS18B20.swift

   Copyright (c) 2017 Umberto Raimondi
   Licensed under the MIT license, as follows:

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.)
*/

import SwiftyGPIO  //Comment this when not using the package manager


public class DS18B20{
    var onew: OneWireInterface
    let slaveId: String

    public init(_ onewire: OneWireInterface, slaveId: String) {
       self.onew = onewire
       self.slaveId = slaveId
    }

    /// Temperature from -55 to +125 degrees Celsius (+/- 0.5C)
    /// Returns 0°K on error
    public var Temperature: Float {

        do {
            for line in try onew.readData(slaveId) {
                //Only 2 lines expected, the 2nd one has the temp value
                guard !line.contains("YES") else {
                    continue
                }
                let words = line.split{$0 == " "}.map(String.init)
                var temp = words[words.count-1]
                temp = String(temp.dropFirst(2))
                return((Float(temp) ?? -273150) / 1000)
            }
        }
        catch {
            // fall through and return the error value NaN
        }

        return Float.nan
    }

}
