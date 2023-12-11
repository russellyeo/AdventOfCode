import Parsing

public struct PuzzleInput: Parser {
    public init() {}
    
    public var body: some Parser<Substring, Grid> {
        GridParser()
    }
}

private struct GridParser: Parser {
    func parse(_ input: inout Substring) throws -> Grid {
        var y: Int = 0
        
        let lines: any Parser<Substring, [[Cell]]> = Many(into: [[Cell]](), { (accumulator: inout [[Cell]], line: [CellType]) in
            let positioned: [Cell] = line.enumerated().map { (x, type) in
                let cell = Cell(position: .init(x: x, y: y), type: type)
                return cell
            }
            y += 1
            accumulator.append(positioned)
        }) {
            LineParser()
        } separator: {
            Whitespace(1, .vertical)
        }
        
        let output: [[Cell]] = try lines.parse(&input)
        return Grid(value: output)
    }
}


private struct LineParser: Parser {
    func parse(_ input: inout Substring) throws -> [CellType] {
        let cells = Many(into: [CellType](), { (accumulator, cellType) in
            accumulator.append(cellType)
        }) {
            CellParser()
        }
        let output = try cells.parse(&input)
        return output
    }
}

private struct CellParser: Parser {
    var body: some Parser<Substring, CellType> {
        Prefix(1).pipe {
            OneOf {
                Int.parser().map { CellType.integer(String($0)) }
                ".".utf8.map { CellType.empty }
                "*".utf8.map { CellType.symbol("*") }
                "+".utf8.map { CellType.symbol("+") }
                "#".utf8.map { CellType.symbol("#") }
                "$".utf8.map { CellType.symbol("$") }
                "/".utf8.map { CellType.symbol("/") }
                "%".utf8.map { CellType.symbol("%") }
                "@".utf8.map { CellType.symbol("@") }
                "&".utf8.map { CellType.symbol("&") }
                "-".utf8.map { CellType.symbol("-") }
                "=".utf8.map { CellType.symbol("=") }
            }
            .replaceError(with: CellType.symbol("*"))
        }
    }
}
