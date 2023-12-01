import Parsing

public struct PuzzleInput: Parser {
    public init() {}
    public var body: some Parser<Substring, [[Int]]> {
        Many {
            Many {
                Prefix(1).pipe { Int.parser() }
            }
        } separator: {
            Whitespace(1, .vertical)
        }
    }
}
