import Foundation

public struct EngineSchematic {
    private let grid: Grid
    
    public init(grid: Grid) {
        self.grid = grid
    }
    
    public func sumOfValidPartNumbers() -> Int {
        let allNumbers = findAllPartNumbers()
        return allNumbers.reduce(into: 0) { result, part in
            if isSurroundedBySymbol(part: part) {
                result += part.value
            }
        }
    }
    
    func findAllPartNumbers() -> [PartNumber] {
        var numbers: [PartNumber] = []
        
        for (columnIndex, row) in grid.value.enumerated() {
            var values: [String] = []
            var positions: [Position: String] = [:]
            
            for (rowIndex, cell) in row.enumerated() {
                switch cell {
                case .empty, .symbol:
                    if !values.isEmpty {
                        let value = Int(values.reduce("", +)) ?? 0
                        let number = PartNumber(value: value, positions: positions)
                        numbers.append(number)
                        values = []
                        positions = [:]
                    }
                case .integer(let value):
                    let position = Position(x: rowIndex, y: columnIndex)
                    positions[position] = value
                    values.append(value)
                }
            }
        }

        return numbers
    }
    
    func isSurroundedBySymbol(part: PartNumber) -> Bool {
        let region = part.surroundingRegion(range: 1)
        for y in 0..<grid.value.count {
            for x in 0..<grid.value[0].count {
                let position = Position(x: x, y: y)
                if region(position), case .symbol = grid.value[y][x] {
                    return true
                }
            }
        }
        return false
    }
}

public struct PartNumber: Equatable {
    /// The integer value of the part number
    let value: Int
    
    /// Positions of the digits in the part number
    let positions: [Position: String]
    
    /// The region of the part number in the grid
    var ownRegion: Region {
        return Region { point in positions.contains(where: { $0.key == point }) }
    }
    
    /// The surrounding region with given range away from the part itself (chessboard distance)
    func surroundingRegion(range: Int) -> Region {
        positions.keys.reduce(Region.empty(), { result, position in
            result.union(with: Region.square(range: range).shift(by: position))
        })
        .subtract(ownRegion)
    }
}
