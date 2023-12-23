import CustomDump
@testable import Day5
import XCTest

final class MapTests: XCTestCase {
    // Seed number 79 corresponds to soil number 81.
    // Seed number 14 corresponds to soil number 14.
    // Seed number 55 corresponds to soil number 57.
    // Seed number 13 corresponds to soil number 13.
    func testFindValueInMap() throws {
        let almanac = Almanac.example
        XCTAssertEqual(almanac.maps[0].findValue(for: 79), 81)
        XCTAssertEqual(almanac.maps[0].findValue(for: 14), 14)
        XCTAssertEqual(almanac.maps[0].findValue(for: 55), 57)
        XCTAssertEqual(almanac.maps[0].findValue(for: 13), 13)
    }
}
