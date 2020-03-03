import XCTest
import SwiftArrayInitializations

let n = 10_000_000 + (Bool.random() ? 1 : 0)

final class SwiftArrayInitializationsTests: XCTestCase {
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
}
