import Parsing

public struct PuzzleInput: ParserPrinter {
    public init() {}
    
    public struct Grid: Equatable {
        public let value: [[Cell]]
    }

    public enum Cell: Equatable {
        case empty
        case integer(Int)
        case symbol(String)
    }
    
    public var body: some ParserPrinter<Substring, Grid> {
        Parse(.memberwise(Grid.init)) {
            Many {
                Many {
                    Prefix(1).pipe {
                        CellParser()
                    }
                }
            } separator: {
                Whitespace(1, .vertical)
            }
        }
    }
    
    struct CellParser: ParserPrinter {
        public var body: some Parser<Substring, Cell> {
            OneOf {
                Int.parser().map(.case(Cell.integer))
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
        
        func print(_ output: PuzzleInput.Cell, into input: inout Substring) throws {
            switch output {
            case .empty:
                input += "."
            case .integer(let i):
                input += String(i)
            case .symbol(let s):
                input += s
            }
        }
    }
}
