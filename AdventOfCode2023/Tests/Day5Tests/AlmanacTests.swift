import CustomDump
@testable import Day5
import XCTest

final class AlmanacTests: XCTestCase {
    // Seed 79, soil 81, fertilizer 81, water 81, light 74, temperature 78, humidity 78, location 82.
    // Seed 14, soil 14, fertilizer 53, water 49, light 42, temperature 42, humidity 43, location 43.
    // Seed 55, soil 57, fertilizer 57, water 53, light 46, temperature 82, humidity 82, location 86.
    // Seed 13, soil 13, fertilizer 52, water 41, light 34, temperature 34, humidity 35, location 35.
    func testFindFinalLocationForSeed() throws {
        let almanac = Almanac.example
        XCTAssertEqual(almanac.findFinalLocation(for: 79), 82)
        XCTAssertEqual(almanac.findFinalLocation(for: 14), 43)
        XCTAssertEqual(almanac.findFinalLocation(for: 55), 86)
        XCTAssertEqual(almanac.findFinalLocation(for: 13), 35)
    }
    
    // location 82, location 43, location 86, location 35. Min: 35.
    func testFindClosestLocationForSeeds() throws {
        let almanac = Almanac.example
        XCTAssertEqual(almanac.findClosestLocation(), 35)
    }
}
