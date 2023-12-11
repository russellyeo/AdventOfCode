@testable import Solution
import XCTest

final class CellTests: XCTestCase {

    func testRegion() throws {
        let cell = Cell(position: .init(x: 2, y: 2), type: .integer("3"))
        let region: Region = cell.region
        // Positions inside the region are included
        XCTAssertTrue(region(Position(x: 2, y: 2)))
        // Positions immediately surrounding are not included
        XCTAssertFalse(region(Position(x: 1, y: 1)))
        XCTAssertFalse(region(Position(x: 2, y: 1)))
        XCTAssertFalse(region(Position(x: 3, y: 1)))
        XCTAssertFalse(region(Position(x: 4, y: 1)))
        XCTAssertFalse(region(Position(x: 1, y: 2)))
        XCTAssertFalse(region(Position(x: 4, y: 2)))
        XCTAssertFalse(region(Position(x: 1, y: 3)))
        XCTAssertFalse(region(Position(x: 2, y: 3)))
        XCTAssertFalse(region(Position(x: 4, y: 3)))
    }
    
    func testSurroundingRegion() throws {
        let cell = Cell(position: .init(x: 2, y: 2), type: .integer("3"))
        let region: Region = cell.surrounding(range: 1)
        // Direct hits are discounted
        XCTAssertFalse(region(Position(x: 2, y: 2)))
        // In the firing range
        XCTAssertTrue(region(Position(x: 1, y: 1)))
        XCTAssertTrue(region(Position(x: 2, y: 1)))
        XCTAssertTrue(region(Position(x: 3, y: 1)))
        XCTAssertTrue(region(Position(x: 1, y: 2)))
        XCTAssertTrue(region(Position(x: 3, y: 2)))
        XCTAssertTrue(region(Position(x: 1, y: 3)))
        XCTAssertTrue(region(Position(x: 2, y: 3)))
        XCTAssertTrue(region(Position(x: 3, y: 3)))
        // Outside the firing range
        XCTAssertFalse(region(Position(x: 0, y: 0)))
        XCTAssertFalse(region(Position(x: 1, y: 0)))
        XCTAssertFalse(region(Position(x: 2, y: 0)))
        XCTAssertFalse(region(Position(x: 3, y: 0)))
        XCTAssertFalse(region(Position(x: 4, y: 0)))
        XCTAssertFalse(region(Position(x: 0, y: 1)))
        XCTAssertFalse(region(Position(x: 0, y: 2)))
        XCTAssertFalse(region(Position(x: 0, y: 3)))
        XCTAssertFalse(region(Position(x: 0, y: 4)))
        XCTAssertFalse(region(Position(x: 1, y: 4)))
        XCTAssertFalse(region(Position(x: 2, y: 4)))
        XCTAssertFalse(region(Position(x: 3, y: 4)))
        XCTAssertFalse(region(Position(x: 4, y: 4)))
        XCTAssertFalse(region(Position(x: 4, y: 3)))
        XCTAssertFalse(region(Position(x: 4, y: 2)))
        XCTAssertFalse(region(Position(x: 4, y: 1)))
    }
    
    func testIsNeighbouringCell() throws {
        let cellA = Cell(position: .init(x: 3, y: 1), type: .symbol("*"))
        let cellB = Cell(position: .init(x: 3, y: 2), type: .integer("5"))
        XCTAssertTrue(cellA.isNeighbouring(cell: cellB, range: 1))
    }
    
    func testIsNotNeighbouringCell() throws {
        let cellA = Cell(position: .init(x: 3, y: 1), type: .symbol("*"))
        let cellB = Cell(position: .init(x: 3, y: 3), type: .empty)
        XCTAssertFalse(cellA.isNeighbouring(cell: cellB, range: 1))
    }
}
