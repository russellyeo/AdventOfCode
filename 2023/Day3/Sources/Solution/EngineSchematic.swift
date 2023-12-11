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
        
        for row in grid.value {
            var cells: [Cell] = []

            for cell in row {
                switch cell.type {
                case .empty, .symbol:
                    if !cells.isEmpty {
                        let number = PartNumber(cells: cells)
                        numbers.append(number)
                        cells = []
                    }
                case .integer:
                    cells.append(cell)
                }
            }
            if !cells.isEmpty {
                let number = PartNumber(cells: cells)
                numbers.append(number)
            }
            cells = []
        }
        
        return numbers
    }
    
    func isSurroundedBySymbol(part: PartNumber) -> Bool {
        let surrounding = part.surroundingRegion(range: 1)
        for y in 0..<grid.value.count {
            for x in 0..<grid.value[0].count {
                let position = Position(x: x, y: y)
                if surrounding(position), case .symbol = grid.value[y][x].type {
                    return true
                }
            }
        }
        return false
    }

}
