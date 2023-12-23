import Foundation

public struct Almanac: Equatable {
    public let seeds: [Int]
    public let maps: [Map]
}

public struct Map: Equatable {
    public let name: String
    public let instructions: [Instruction]
}

public struct Instruction: Equatable {
    public let destinationRange: Range<Int>
    public let sourceRange: Range<Int>
}
