import Foundation

public struct Grid: Hashable {
    public let value: [[Cell]]
}

extension Grid {
    func allCells() -> [Cell] {
        value.flatMap { $0 }
    }
    
    func findAllCells(of type: CellType) -> [Cell] {
        allCells().filter { $0.type == type }
    }
    
    func findAllSymbols() -> [Cell] {
        allCells().filter {
            if case .symbol = $0.type {
                return true
            }
            return false
        }
    }
    
    func findAllPartNumbers() -> [PartNumber] {
        value.flatMap { row in
            var parts: [[Cell]] = [[]]

            for cell in row {
                switch cell.type {
                case .empty, .symbol:
                    if let last = parts.last, !last.isEmpty {
                        // Insert empty array to mark boundaries between numbers
                        parts.append([])
                    }
                case .integer:
                    parts[parts.count - 1].append(cell)
                }
            }

            return parts
                .filter { !$0.isEmpty }
                .map { PartNumber(cells: $0) }
         }
    }
}
