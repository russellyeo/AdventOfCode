@testable import Day3
import XCTest

final class GridTests: XCTestCase {
    
    func testFindGears() throws {
        let gears = Grid.example.findAllCells(of: .symbol("*"))
        XCTAssertEqual(gears.count, 3)
        XCTAssertEqual(gears[0].position, Position(x: 3, y: 1))
        XCTAssertEqual(gears[1].position, Position(x: 3, y: 4))
        XCTAssertEqual(gears[2].position, Position(x: 5, y: 8))
    }
    
    func testFindAllSymbols() throws {
        let symbols = Grid.example.findAllSymbols()
        XCTAssertEqual(symbols.count, 6)
        XCTAssertEqual(symbols[0], Cell(position: Position(x: 3, y: 1), type: .symbol("*")))
        XCTAssertEqual(symbols[1], Cell(position: Position(x: 6, y: 3), type: .symbol("#")))
        XCTAssertEqual(symbols[2], Cell(position: Position(x: 3, y: 4), type: .symbol("*")))
        XCTAssertEqual(symbols[3], Cell(position: Position(x: 5, y: 5), type: .symbol("+")))
        XCTAssertEqual(symbols[4], Cell(position: Position(x: 3, y: 8), type: .symbol("$")))
        XCTAssertEqual(symbols[5], Cell(position: Position(x: 5, y: 8), type: .symbol("*")))
    }
    
    func testFindPartNumbers() throws {
        let numbers = Grid.example.findAllPartNumbers()
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
    
    func test_RedditExample_FindPartNumbers() throws {
        let numbers = Grid.reddit.findAllPartNumbers()
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
