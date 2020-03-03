# SwiftArrayInitializations

```swift
func testRepeating() {
    measure {
        var array = [Int](repeating: 0, count: n)
        for i in 0..<n {
          array[i] = i
        }
        XCTAssertEqual(array.count, n)
    }
}

func testReserveCapacity() {
    measure {
        var array = [Int]()
        array.reserveCapacity(n)
        for i in 0..<n {
          array.append(i)
        }
        XCTAssertEqual(array.count, n)
    }
}

func testUninitialized() {
    measure {
        let array = [Int](unsafeUninitializedCapacity: n) { (buffer, count) in
            for i in 0..<n {
              buffer[i] = i
            }
            count = n
        }
        XCTAssertEqual(array.count, n)
    }
}
```

```
$ swift test -c release
...
... Test Case '-[... testRepeating]' measured [Time, seconds] average: 0.022, relative standard deviation: 40.146%, values: [0.048395, 0.018514, 0.020904, 0.019159, 0.020516, 0.018858, 0.017932, 0.018412, 0.018950, 0.018507], ...
...
... Test Case '-[... testReserveCapacity]' measured [Time, seconds] average: 0.031, relative standard deviation: 1.180%, values: [0.031363, 0.031350, 0.031019, 0.030678, 0.030642, 0.030360, 0.031379, 0.030638, 0.031113, 0.030515], ...
...
... Test Case '-[... testUninitialized]' measured [Time, seconds] average: 0.015, relative standard deviation: 2.338%, values: [0.015227, 0.014671, 0.014587, 0.015779, 0.014890, 0.014708, 0.014772, 0.014763, 0.015008, 0.014586], ...
...
```
