import Parsing

// Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

public struct PuzzleInput: Parser {
    public init() {}
    public var body: some Parser<Substring, [Game]> {
        Many {
            GameParser()
        } separator: {
            Whitespace(1, .vertical)
        }
    }
}

struct GameParser: Parser {
    var body: some Parser<Substring, Game> {
        Parse { id, hands in
            Game(id: id, hands: hands)
        } with: {
            "Game "
            Int.parser()
            ": "
            Many {
                HandParser()
            } separator: {
                "; "
            }
        }
    }
}

struct HandParser: Parser {
    var body: some Parser<Substring, [Colour: Int]> {
        Many(into: [Colour: Int](), { dictionary, element in
            dictionary[element.1] = element.0
        }) {
            ColourCountParser()
        } separator: {
            ", "
        }
    }
}

struct ColourCountParser: Parser {
    var body: some Parser<Substring, (Int, Colour)> {
        Parse {
            Int.parser()
            Whitespace(1, .horizontal)
            OneOf {
                "red".map { Colour.red }
                "green".map { Colour.green }
                "blue".map { Colour.blue }
            }
        }
    }
}
