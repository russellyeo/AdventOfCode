import Foundation

public struct Position: Hashable {
    public let x: Int
    public let y: Int
}

extension Position {
    func minus(_ p: Position) -> Position {
        Position(x: x - p.x, y: y - p.y)
    }
    
    var length: Double {
        sqrt(Double(x * x + y * y))
    }
}
