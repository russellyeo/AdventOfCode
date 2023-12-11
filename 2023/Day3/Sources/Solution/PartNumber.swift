import Foundation

public struct PartNumber: Equatable {
    /// The cells in the part number
    let cells: [Cell]
}

extension PartNumber {
    /// The integer value of the part number
    var value: Int {
        let string = cells.reduce(into: "", { accumulator, cell in
            guard case .integer(let value) = cell.type else { return }
            accumulator += value
        })
        return Int(string) ?? 0
    }
    
    /// The region of the part number in the grid
    var region: Region {
        Region { position in cells.map(\.position).contains(where: { $0 == position }) }
    }
    
    /// The surrounding region with given range away from the part itself (chessboard distance)
    func surrounding(range: Int) -> Region {
        cells.map(\.position).reduce(Region.empty(), { result, position in
            result.union(with: Region.square(range: range).shift(by: position))
        })
        .subtract(region)
    }
    
    func isNeighbouring(cell: Cell, range: Int) -> Bool {
        surrounding(range: range)(cell.position)
    }
}

