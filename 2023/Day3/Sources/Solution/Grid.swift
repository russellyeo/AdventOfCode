import Foundation

public struct Grid: Equatable {
    public let value: [[Cell]]
}

public struct Cell: Equatable {
    public let position: Position
    public let type: CellType
}

public enum CellType: Equatable {
    case empty
    case integer(String)
    case symbol(String)
}
