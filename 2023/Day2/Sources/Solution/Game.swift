import Foundation

public struct Game: Equatable {
    public let id: Int
    public let hands: [[Colour: Int]]
}

public enum Colour: Equatable {
    case red
    case blue
    case green
}
