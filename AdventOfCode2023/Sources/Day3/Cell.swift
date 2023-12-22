import Foundation

public struct Cell: Hashable {
    public let position: Position
    public let type: CellType
}

public enum CellType: Hashable {
    case empty
    case integer(String)
    case symbol(String)
}

extension Cell {
    var region: Region {
        Region { $0 == position }
    }
    
    func surrounding(range: Int) -> Region {
        Region
            .square(range: range)
            .shift(by: position)
            .subtract(region)
    }
    
    func isNeighbouring(cell: Cell, range: Int) -> Bool {
        surrounding(range: range)(cell.position)
    }

}

