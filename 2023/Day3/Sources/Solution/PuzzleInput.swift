import Parsing

public struct PuzzleInput: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Grid> {
        Parse(Grid.init) {
            Many {
                Many {
                    Prefix(1).pipe {
                        OneOf {
                            Int.parser().map { Cell.integer(String($0)) }
                            ".".utf8.map { Cell.empty }
                            "*".utf8.map { Cell.symbol("*") }
                            "+".utf8.map { Cell.symbol("+") }
                            "#".utf8.map { Cell.symbol("#") }
                            "$".utf8.map { Cell.symbol("$") }
                            "/".utf8.map { Cell.symbol("/") }
                            "%".utf8.map { Cell.symbol("%") }
                            "@".utf8.map { Cell.symbol("@") }
                            "&".utf8.map { Cell.symbol("&") }
                            "-".utf8.map { Cell.symbol("-") }
                            "=".utf8.map { Cell.symbol("=") }
                        }
                        .replaceError(with: Cell.symbol("*"))
                    }
                }
            } separator: {
                Whitespace(1, .vertical)
            }
        }
    }
}
