import CustomDump
@testable import Solution
import XCTest

final class EngineSchematicTests: XCTestCase {
    
    func testFindPartNumbers() throws {
        let schematic = EngineSchematic(grid: .example)
        let numbers = schematic.findAllPartNumbers()
        XCTAssertNoDifference(numbers.count, 10)
        XCTAssertNoDifference(numbers[0], .number467)
        XCTAssertNoDifference(numbers[1], .number114)
        XCTAssertNoDifference(numbers[2], .number35)
        XCTAssertNoDifference(numbers[3], .number633)
        XCTAssertNoDifference(numbers[4], .number617)
        XCTAssertNoDifference(numbers[5], .number58)
        XCTAssertNoDifference(numbers[6], .number592)
        XCTAssertNoDifference(numbers[7], .number755)
        XCTAssertNoDifference(numbers[8], .number664)
        XCTAssertNoDifference(numbers[9], .number598)
    }
    
    func testIsSurroundedBySymbol() throws {
        let schematic = EngineSchematic(grid: .example)
        // True
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number467))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number35))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number633))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number617))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number592))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number755))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number664))
        XCTAssertTrue(schematic.isSurroundedBySymbol(part: .number598))
        // False
        XCTAssertFalse(schematic.isSurroundedBySymbol(part: .number114))
        XCTAssertFalse(schematic.isSurroundedBySymbol(part: .number58))
    }
    
    func testFindAnswer() throws {
        let schematic = EngineSchematic(grid: .example)
        let answer = schematic.sumOfValidPartNumbers()
        XCTAssertEqual(answer, 4361)
    }
    
}
