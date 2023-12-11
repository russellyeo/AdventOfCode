import Foundation

typealias Distance = Int

struct Region {
    let lookup: (Position) -> Bool
    
    func callAsFunction(_ position: Position) -> Bool {
        lookup(position)
    }

    // Euclidian distance
    static func circle(radius: Distance) -> Region {
        Region { point in point.length <= Double(radius) }
    }
    
    // Manhattan distance
    static func diamond(range: Distance) -> Region {
        Region { point in abs(point.x) + abs(point.y) <= range }
    }
    
    // Chessboard distance
    static func square(range: Distance) -> Region {
        Region { point in max(abs(point.x), abs(point.y)) <= range }
    }
    
    static func empty() -> Region {
        Region { _ in false }
    }

    func shift(by offset: Position) -> Region {
        Region { point in lookup(point.minus(offset)) }
    }

    func invert() -> Region {
        Region { point in !lookup(point) }
    }

    func intersect(with other: Region) -> Region {
        Region { point in lookup(point) && other.lookup(point) }
    }

    func union(with other: Region) -> Region {
        Region { point in lookup(point) || other.lookup(point) }
    }

    func subtract(_ other: Region) -> Region {
        intersect(with: other.invert())
    }

}

