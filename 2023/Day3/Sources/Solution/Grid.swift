import Foundation

public struct Grid: Equatable {
    public let value: [[Cell]]
}

public enum Cell: Equatable {
    case empty
    case integer(String)
    case symbol(String)
}
