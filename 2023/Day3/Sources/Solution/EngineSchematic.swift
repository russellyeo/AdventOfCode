import Foundation

public struct EngineSchematic {
    private let grid: Grid
    
    public init(grid: Grid) {
        self.grid = grid
    }
    
    public func sumOfValidPartNumbers() -> Int {
        let allSymbols = grid.findAllSymbols()
        
        return findNeighbours(for: allSymbols)
            .values
            .reduce(into: 0) { sum, neighbours in
                sum += neighbours.reduce(into: 0) { accumulator, number in
                    accumulator += number.value
                }
            }
    }
    
    public func sumOfGearRatios() -> Int {
        let allGears = grid.findAllCells(of: .symbol("*"))

        return findNeighbours(for: allGears)
            .values
            .reduce(into: 0) { sum, neighbours in
                guard neighbours.count == 2 else { return }
                sum += neighbours[0].value * neighbours[1].value
            }
    }
    
    private func findNeighbours(for cells: [Cell]) -> [Cell: [PartNumber]] {
        let allNumbers = grid.findAllPartNumbers()
        
        return cells.reduce(into: [Cell: [PartNumber]]()) { result, cell in
            result[cell] = allNumbers.filter { number in
                number.isNeighbouring(cell: cell, range: 1)
            }
        }
    }
    
}
