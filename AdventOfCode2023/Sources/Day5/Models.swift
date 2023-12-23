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

// MARK: Extensions

extension Almanac {
    public func findClosestLocation() -> Int? {
        seeds.map(findFinalLocation).min()
    }
    
    public func findFinalLocation(for seed: Int) -> Int {
        maps.reduce(seed) { accumulator, map in
            map.findValue(for: accumulator)
        }
    }
}

extension Map {
    public func findValue(for value: Int) -> Int {
        for instruction in instructions {
            if instruction.sourceRange.contains(value) {
                let offset = value - instruction.sourceRange.lowerBound
                return instruction.destinationRange.lowerBound + offset
            }
        }
        return value
    }
}
