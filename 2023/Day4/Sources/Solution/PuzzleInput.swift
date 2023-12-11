import Parsing

public struct PuzzleInput: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Scratchcards> {
        Parse { output in
            Scratchcards(cards: output.map { (id, sets) in
                Card(id: id, winning: sets.0, mine: sets.1)
            })
        } with: {
            Many {
                CardIDParser()
                SkipAtLeastOneSpace()
                CardNumbersParser()
            } separator: {
                Whitespace(1, .vertical)
            }
        }
    }
}

private struct CardIDParser: Parser {
    var body: some Parser<Substring, Int> {
        "Card"
        SkipAtLeastOneSpace()
        Int.parser()
        ":"
    }
}

private struct CardNumbersParser: Parser {
    var body: some Parser<Substring, ([Int], [Int])> {
        NumbersParser()
        SkipAtLeastOneSpace()
        "|"
        SkipAtLeastOneSpace()
        NumbersParser()
    }
}

private struct NumbersParser: Parser {
    var body: some Parser<Substring, ([Int])> {
        Many {
            Int.parser()
        } separator: {
            SkipAtLeastOneSpace()
        }
    }
}

private struct SkipAtLeastOneSpace: Parser {
    var body: some Parser<Substring, Void> {
        Skip { Prefix(1...) { $0 == " " } }
    }
}
