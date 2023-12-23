import Parsing

public struct AlmanacParser: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Almanac> {
        Parse { seeds, maps in
            Almanac(seeds: seeds, maps: maps)
        } with: {
            SeedsParser()
            Whitespace(2, .vertical)
            Many {
                MapParser()
            } separator: {
                Whitespace(2, .vertical)
            }
        }
    }
}

public struct SeedsParser: Parser {
    public init() {}
    
    public var body: some Parser<Substring, [Int]> {
        "seeds: "
        Many {
            Int.parser()
        } separator: {
            Whitespace(1, .horizontal)
        }
    }
}

public struct MapParser: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Map> {
        Parse { name, instructions in
            Map(name: name, instructions: instructions)
        } with: {
            PrefixUpTo(" ").map(String.init)
            Skip { PrefixThrough("\n") }
            Many {
                InstructionParser()
            } separator: {
                Whitespace(1, .vertical)
            }
        }
    }
}

public struct InstructionParser: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Instruction> {
        Parse { destinationRangeStart, sourceRangeStart, rangeLength in
            Instruction(
                destinationRange: destinationRangeStart..<(destinationRangeStart + rangeLength),
                sourceRange: sourceRangeStart..<(sourceRangeStart + rangeLength)
            )
        } with: {
            Int.parser()
            Whitespace(1, .horizontal)
            Int.parser()
            Whitespace(1, .horizontal)
            Int.parser()
        }
    }
}
