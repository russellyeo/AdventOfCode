@testable import Solution
import XCTest

final class EngineSchematicTests: XCTestCase {
    
    // MARK: Puzzle Example
    
    func test_PuzzleExample_FindPartNumbers() throws {
        let schematic = EngineSchematic(grid: .example)
        let numbers = schematic.findAllPartNumbers()
        XCTAssertEqual(numbers.count, 10)
        XCTAssertEqual(numbers[0], .number467)
        XCTAssertEqual(numbers[1], .number114)
        XCTAssertEqual(numbers[2], .number35)
        XCTAssertEqual(numbers[3], .number633)
        XCTAssertEqual(numbers[4], .number617)
        XCTAssertEqual(numbers[5], .number58)
        XCTAssertEqual(numbers[6], .number592)
        XCTAssertEqual(numbers[7], .number755)
        XCTAssertEqual(numbers[8], .number664)
        XCTAssertEqual(numbers[9], .number598)
    }
    
    func test_PuzzleExample_IsSurroundedBySymbol() throws {
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
    
    func test_PuzzleExample_FindAnswer() throws {
        let schematic = EngineSchematic(grid: .example)
        let answer = schematic.sumOfValidPartNumbers()
        XCTAssertEqual(answer, 4361)
    }
    
    // MARK: Reddit Example
    
    func test_RedditExample_FindPartNumbers() throws {
        let schematic = EngineSchematic(grid: .reddit)
        let numbers = schematic.findAllPartNumbers()
        XCTAssertEqual(numbers.count, 19)
        XCTAssertEqual(numbers[0].value, 12)
        XCTAssertEqual(numbers[1].value, 34)
        XCTAssertEqual(numbers[2].value, 12)
        XCTAssertEqual(numbers[3].value, 78)
        XCTAssertEqual(numbers[4].value, 60)
        XCTAssertEqual(numbers[5].value, 78)
        XCTAssertEqual(numbers[6].value, 9)
        XCTAssertEqual(numbers[7].value, 5)
        XCTAssertEqual(numbers[8].value, 23)
        XCTAssertEqual(numbers[9].value, 8)
        XCTAssertEqual(numbers[10].value, 90)
        XCTAssertEqual(numbers[11].value, 12)
        XCTAssertEqual(numbers[12].value, 2)
        XCTAssertEqual(numbers[13].value, 2)
        XCTAssertEqual(numbers[14].value, 12)
        XCTAssertEqual(numbers[15].value, 1)
        XCTAssertEqual(numbers[16].value, 1)
        XCTAssertEqual(numbers[17].value, 503)
        XCTAssertEqual(numbers[18].value, 56)
    }

}
