@testable import Solution

extension Grid {

    // 467..114..
    // ...*......
    // ..35..633.
    // ......#...
    // 617*......
    // .....+.58.
    // ..592.....
    // ......755.
    // ...$.*....
    // .664.598..
    static var example: Grid {
        Grid(value: [
            [
                Cell(position: .init(x: 0, y: 0), type: .integer("4")),
                Cell(position: .init(x: 1, y: 0), type: .integer("6")),
                Cell(position: .init(x: 2, y: 0), type: .integer("7")),
                Cell(position: .init(x: 3, y: 0), type: .empty),
                Cell(position: .init(x: 4, y: 0), type: .empty),
                Cell(position: .init(x: 5, y: 0), type: .integer("1")),
                Cell(position: .init(x: 6, y: 0), type: .integer("1")),
                Cell(position: .init(x: 7, y: 0), type: .integer("4")),
                Cell(position: .init(x: 8, y: 0), type: .empty),
                Cell(position: .init(x: 9, y: 0), type: .empty)
            ],
            [
                Cell(position: .init(x: 0, y: 1), type: .empty),
                Cell(position: .init(x: 1, y: 1), type: .empty),
                Cell(position: .init(x: 2, y: 1), type: .empty),
                Cell(position: .init(x: 3, y: 1), type: .symbol("*")),
                Cell(position: .init(x: 4, y: 1), type: .empty),
                Cell(position: .init(x: 5, y: 1), type: .empty),
                Cell(position: .init(x: 6, y: 1), type: .empty),
                Cell(position: .init(x: 7, y: 1), type: .empty),
                Cell(position: .init(x: 8, y: 1), type: .empty),
                Cell(position: .init(x: 9, y: 1), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 2), type: .empty),
                Cell(position: .init(x: 1, y: 2), type: .empty),
                Cell(position: .init(x: 2, y: 2), type: .integer("3")),
                Cell(position: .init(x: 3, y: 2), type: .integer("5")),
                Cell(position: .init(x: 4, y: 2), type: .empty),
                Cell(position: .init(x: 5, y: 2), type: .empty),
                Cell(position: .init(x: 6, y: 2), type: .integer("6")),
                Cell(position: .init(x: 7, y: 2), type: .integer("3")),
                Cell(position: .init(x: 8, y: 2), type: .integer("3")),
                Cell(position: .init(x: 9, y: 2), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 3), type: .empty),
                Cell(position: .init(x: 1, y: 3), type: .empty),
                Cell(position: .init(x: 2, y: 3), type: .empty),
                Cell(position: .init(x: 3, y: 3), type: .empty),
                Cell(position: .init(x: 4, y: 3), type: .empty),
                Cell(position: .init(x: 5, y: 3), type: .empty),
                Cell(position: .init(x: 6, y: 3), type: .symbol("#")),
                Cell(position: .init(x: 7, y: 3), type: .empty),
                Cell(position: .init(x: 8, y: 3), type: .empty),
                Cell(position: .init(x: 9, y: 3), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 4), type: .integer("6")),
                Cell(position: .init(x: 1, y: 4), type: .integer("1")),
                Cell(position: .init(x: 2, y: 4), type: .integer("7")),
                Cell(position: .init(x: 3, y: 4), type: .symbol("*")),
                Cell(position: .init(x: 4, y: 4), type: .empty),
                Cell(position: .init(x: 5, y: 4), type: .empty),
                Cell(position: .init(x: 6, y: 4), type: .empty),
                Cell(position: .init(x: 7, y: 4), type: .empty),
                Cell(position: .init(x: 8, y: 4), type: .empty),
                Cell(position: .init(x: 9, y: 4), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 5), type: .empty),
                Cell(position: .init(x: 1, y: 5), type: .empty),
                Cell(position: .init(x: 2, y: 5), type: .empty),
                Cell(position: .init(x: 3, y: 5), type: .empty),
                Cell(position: .init(x: 4, y: 5), type: .empty),
                Cell(position: .init(x: 5, y: 5), type: .symbol("+")),
                Cell(position: .init(x: 6, y: 5), type: .empty),
                Cell(position: .init(x: 7, y: 5), type: .integer("5")),
                Cell(position: .init(x: 8, y: 5), type: .integer("8")),
                Cell(position: .init(x: 9, y: 5), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 6), type: .empty),
                Cell(position: .init(x: 1, y: 6), type: .empty),
                Cell(position: .init(x: 2, y: 6), type: .integer("5")),
                Cell(position: .init(x: 3, y: 6), type: .integer("9")),
                Cell(position: .init(x: 4, y: 6), type: .integer("2")),
                Cell(position: .init(x: 5, y: 6), type: .empty),
                Cell(position: .init(x: 6, y: 6), type: .empty),
                Cell(position: .init(x: 7, y: 6), type: .empty),
                Cell(position: .init(x: 8, y: 6), type: .empty),
                Cell(position: .init(x: 9, y: 6), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 7), type: .empty),
                Cell(position: .init(x: 1, y: 7), type: .empty),
                Cell(position: .init(x: 2, y: 7), type: .empty),
                Cell(position: .init(x: 3, y: 7), type: .empty),
                Cell(position: .init(x: 4, y: 7), type: .empty),
                Cell(position: .init(x: 5, y: 7), type: .empty),
                Cell(position: .init(x: 6, y: 7), type: .integer("7")),
                Cell(position: .init(x: 7, y: 7), type: .integer("5")),
                Cell(position: .init(x: 8, y: 7), type: .integer("5")),
                Cell(position: .init(x: 9, y: 7), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 8), type: .empty),
                Cell(position: .init(x: 1, y: 8), type: .empty),
                Cell(position: .init(x: 2, y: 8), type: .empty),
                Cell(position: .init(x: 3, y: 8), type: .symbol("$")),
                Cell(position: .init(x: 4, y: 8), type: .empty),
                Cell(position: .init(x: 5, y: 8), type: .symbol("*")),
                Cell(position: .init(x: 6, y: 8), type: .empty),
                Cell(position: .init(x: 7, y: 8), type: .empty),
                Cell(position: .init(x: 8, y: 8), type: .empty),
                Cell(position: .init(x: 9, y: 8), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 9), type: .empty),
                Cell(position: .init(x: 1, y: 9), type: .integer("6")),
                Cell(position: .init(x: 2, y: 9), type: .integer("6")),
                Cell(position: .init(x: 3, y: 9), type: .integer("4")),
                Cell(position: .init(x: 4, y: 9), type: .empty),
                Cell(position: .init(x: 5, y: 9), type: .integer("5")),
                Cell(position: .init(x: 6, y: 9), type: .integer("9")),
                Cell(position: .init(x: 7, y: 9), type: .integer("8")),
                Cell(position: .init(x: 8, y: 9), type: .empty),
                Cell(position: .init(x: 9, y: 9), type: .empty),
            ],
        ])
    }
    
    
    // 12.......*..
    // +.........34
    // .......-12..
    // ..78........
    // ..*....60...
    // 78.........9
    // .5.....23..$
    // 8...90*12...
    // ............
    // 2.2......12.
    // .*.........*
    // 1.1..503+.56
    static var reddit: Grid {
        Grid(value: [
            [
                Cell(position: .init(x: 0, y: 0), type: .integer("1")),
                Cell(position: .init(x: 1, y: 0), type: .integer("2")),
                Cell(position: .init(x: 2, y: 0), type: .empty),
                Cell(position: .init(x: 3, y: 0), type: .empty),
                Cell(position: .init(x: 4, y: 0), type: .empty),
                Cell(position: .init(x: 5, y: 0), type: .empty),
                Cell(position: .init(x: 6, y: 0), type: .empty),
                Cell(position: .init(x: 7, y: 0), type: .empty),
                Cell(position: .init(x: 8, y: 0), type: .empty),
                Cell(position: .init(x: 9, y: 0), type: .symbol("*")),
                Cell(position: .init(x: 10, y: 0), type: .empty),
                Cell(position: .init(x: 11, y: 0), type: .empty)
            ],
            [
                Cell(position: .init(x: 0, y: 1), type: .symbol("+")),
                Cell(position: .init(x: 1, y: 1), type: .empty),
                Cell(position: .init(x: 2, y: 1), type: .empty),
                Cell(position: .init(x: 3, y: 1), type: .empty),
                Cell(position: .init(x: 4, y: 1), type: .empty),
                Cell(position: .init(x: 5, y: 1), type: .empty),
                Cell(position: .init(x: 6, y: 1), type: .empty),
                Cell(position: .init(x: 7, y: 1), type: .empty),
                Cell(position: .init(x: 8, y: 1), type: .empty),
                Cell(position: .init(x: 9, y: 1), type: .empty),
                Cell(position: .init(x: 10, y: 1), type: .integer("3")),
                Cell(position: .init(x: 11, y: 1), type: .integer("4")),
            ],
            [
                Cell(position: .init(x: 0, y: 2), type: .empty),
                Cell(position: .init(x: 1, y: 2), type: .empty),
                Cell(position: .init(x: 2, y: 2), type: .empty),
                Cell(position: .init(x: 3, y: 2), type: .empty),
                Cell(position: .init(x: 4, y: 2), type: .empty),
                Cell(position: .init(x: 5, y: 2), type: .empty),
                Cell(position: .init(x: 6, y: 2), type: .empty),
                Cell(position: .init(x: 7, y: 2), type: .symbol("-")),
                Cell(position: .init(x: 8, y: 2), type: .integer("1")),
                Cell(position: .init(x: 9, y: 2), type: .integer("2")),
                Cell(position: .init(x: 10, y: 2), type: .empty),
                Cell(position: .init(x: 11, y: 2), type: .empty)
            ],
            [
                Cell(position: .init(x: 0, y: 3), type: .empty),
                Cell(position: .init(x: 1, y: 3), type: .empty),
                Cell(position: .init(x: 2, y: 3), type: .integer("7")),
                Cell(position: .init(x: 3, y: 3), type: .integer("8")),
                Cell(position: .init(x: 4, y: 3), type: .empty),
                Cell(position: .init(x: 5, y: 3), type: .empty),
                Cell(position: .init(x: 6, y: 3), type: .empty),
                Cell(position: .init(x: 7, y: 3), type: .empty),
                Cell(position: .init(x: 8, y: 3), type: .empty),
                Cell(position: .init(x: 9, y: 3), type: .empty),
                Cell(position: .init(x: 10, y: 3), type: .empty),
                Cell(position: .init(x: 11, y: 3), type: .empty)
            ],
            [
                Cell(position: .init(x: 0, y: 4), type: .empty),
                Cell(position: .init(x: 1, y: 4), type: .empty),
                Cell(position: .init(x: 2, y: 4), type: .symbol("*")),
                Cell(position: .init(x: 3, y: 4), type: .empty),
                Cell(position: .init(x: 4, y: 4), type: .empty),
                Cell(position: .init(x: 5, y: 4), type: .empty),
                Cell(position: .init(x: 6, y: 4), type: .empty),
                Cell(position: .init(x: 7, y: 4), type: .integer("6")),
                Cell(position: .init(x: 8, y: 4), type: .integer("0")),
                Cell(position: .init(x: 9, y: 4), type: .empty),
                Cell(position: .init(x: 10, y: 4), type: .empty),
                Cell(position: .init(x: 11, y: 4), type: .empty),
                
            ],
            [
                Cell(position: .init(x: 0, y: 5), type: .integer("7")),
                Cell(position: .init(x: 1, y: 5), type: .integer("8")),
                Cell(position: .init(x: 2, y: 5), type: .empty),
                Cell(position: .init(x: 3, y: 5), type: .empty),
                Cell(position: .init(x: 4, y: 5), type: .empty),
                Cell(position: .init(x: 5, y: 5), type: .empty),
                Cell(position: .init(x: 6, y: 5), type: .empty),
                Cell(position: .init(x: 7, y: 5), type: .empty),
                Cell(position: .init(x: 8, y: 5), type: .empty),
                Cell(position: .init(x: 9, y: 5), type: .empty),
                Cell(position: .init(x: 10, y: 5), type: .empty),
                Cell(position: .init(x: 11, y: 5), type: .integer("9")),
            ],
            [
                Cell(position: .init(x: 0, y: 6), type: .empty),
                Cell(position: .init(x: 1, y: 6), type: .integer("5")),
                Cell(position: .init(x: 2, y: 6), type: .empty),
                Cell(position: .init(x: 3, y: 6), type: .empty),
                Cell(position: .init(x: 4, y: 6), type: .empty),
                Cell(position: .init(x: 5, y: 6), type: .empty),
                Cell(position: .init(x: 6, y: 6), type: .empty),
                Cell(position: .init(x: 7, y: 6), type: .integer("2")),
                Cell(position: .init(x: 8, y: 6), type: .integer("3")),
                Cell(position: .init(x: 9, y: 6), type: .empty),
                Cell(position: .init(x: 10, y: 6), type: .empty),
                Cell(position: .init(x: 11, y: 6), type: .symbol("$")),
            ],
            [
                Cell(position: .init(x: 0, y: 7), type: .integer("8")),
                Cell(position: .init(x: 1, y: 7), type: .empty),
                Cell(position: .init(x: 2, y: 7), type: .empty),
                Cell(position: .init(x: 3, y: 7), type: .empty),
                Cell(position: .init(x: 4, y: 7), type: .integer("9")),
                Cell(position: .init(x: 5, y: 7), type: .integer("0")),
                Cell(position: .init(x: 6, y: 7), type: .symbol("*")),
                Cell(position: .init(x: 7, y: 7), type: .integer("1")),
                Cell(position: .init(x: 8, y: 7), type: .integer("2")),
                Cell(position: .init(x: 9, y: 7), type: .empty),
                Cell(position: .init(x: 10, y: 7), type: .empty),
                Cell(position: .init(x: 11, y: 7), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 8), type: .empty),
                Cell(position: .init(x: 1, y: 8), type: .empty),
                Cell(position: .init(x: 2, y: 8), type: .empty),
                Cell(position: .init(x: 3, y: 8), type: .empty),
                Cell(position: .init(x: 4, y: 8), type: .empty),
                Cell(position: .init(x: 5, y: 8), type: .empty),
                Cell(position: .init(x: 6, y: 8), type: .empty),
                Cell(position: .init(x: 7, y: 8), type: .empty),
                Cell(position: .init(x: 8, y: 8), type: .empty),
                Cell(position: .init(x: 9, y: 8), type: .empty),
                Cell(position: .init(x: 10, y: 8), type: .empty),
                Cell(position: .init(x: 11, y: 8), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 9), type: .integer("2")),
                Cell(position: .init(x: 1, y: 9), type: .empty),
                Cell(position: .init(x: 2, y: 9), type: .integer("2")),
                Cell(position: .init(x: 3, y: 9), type: .empty),
                Cell(position: .init(x: 4, y: 9), type: .empty),
                Cell(position: .init(x: 5, y: 9), type: .empty),
                Cell(position: .init(x: 6, y: 9), type: .empty),
                Cell(position: .init(x: 7, y: 9), type: .empty),
                Cell(position: .init(x: 8, y: 9), type: .empty),
                Cell(position: .init(x: 9, y: 9), type: .integer("1")),
                Cell(position: .init(x: 10, y: 9), type: .integer("2")),
                Cell(position: .init(x: 11, y: 9), type: .empty),
            ],
            [
                Cell(position: .init(x: 0, y: 10), type: .empty),
                Cell(position: .init(x: 1, y: 10), type: .symbol("*")),
                Cell(position: .init(x: 2, y: 10), type: .empty),
                Cell(position: .init(x: 3, y: 10), type: .empty),
                Cell(position: .init(x: 4, y: 10), type: .empty),
                Cell(position: .init(x: 5, y: 10), type: .empty),
                Cell(position: .init(x: 6, y: 10), type: .empty),
                Cell(position: .init(x: 7, y: 10), type: .empty),
                Cell(position: .init(x: 8, y: 10), type: .empty),
                Cell(position: .init(x: 9, y: 10), type: .empty),
                Cell(position: .init(x: 10, y: 10), type: .empty),
                Cell(position: .init(x: 11, y: 10), type: .symbol("*")),
            ],
            [
                Cell(position: .init(x: 0, y: 11), type: .integer("1")),
                Cell(position: .init(x: 1, y: 11), type: .empty),
                Cell(position: .init(x: 2, y: 11), type: .integer("1")),
                Cell(position: .init(x: 3, y: 11), type: .empty),
                Cell(position: .init(x: 4, y: 11), type: .empty),
                Cell(position: .init(x: 5, y: 11), type: .integer("5")),
                Cell(position: .init(x: 6, y: 11), type: .integer("0")),
                Cell(position: .init(x: 7, y: 11), type: .integer("3")),
                Cell(position: .init(x: 8, y: 11), type: .symbol("+")),
                Cell(position: .init(x: 9, y: 11), type: .empty),
                Cell(position: .init(x: 10, y: 11), type: .integer("5")),
                Cell(position: .init(x: 11, y: 11), type: .integer("6"))
            ]
        ])
    }

}

extension PartNumber {
    
    // MARK: Puzzle Example
    
    static var number467: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 0, y: 0), type: .integer("4")),
            Cell(position: .init(x: 1, y: 0), type: .integer("6")),
            Cell(position: .init(x: 2, y: 0), type: .integer("7"))
        ])
    }
    
    static var number114: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 5, y: 0), type: .integer("1")),
            Cell(position: .init(x: 6, y: 0), type: .integer("1")),
            Cell(position: .init(x: 7, y: 0), type: .integer("4"))
        ])
    }
    
    static var number35: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 2, y: 2), type: .integer("3")),
            Cell(position: .init(x: 3, y: 2), type: .integer("5")),
        ])
    }
    
    static var number633: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 6, y: 2), type: .integer("6")),
            Cell(position: .init(x: 7, y: 2), type: .integer("3")),
            Cell(position: .init(x: 8, y: 2), type: .integer("3")),
        ])
    }
    
    static var number617: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 0, y: 4), type: .integer("6")),
            Cell(position: .init(x: 1, y: 4), type: .integer("1")),
            Cell(position: .init(x: 2, y: 4), type: .integer("7")),
        ])
    }
    
    static var number58: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 7, y: 5), type: .integer("5")),
            Cell(position: .init(x: 8, y: 5), type: .integer("8"))
        ])
    }
    
    static var number592: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 2, y: 6), type: .integer("5")),
            Cell(position: .init(x: 3, y: 6), type: .integer("9")),
            Cell(position: .init(x: 4, y: 6), type: .integer("2"))
        ])
    }
    
    static var number755: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 6, y: 7), type: .integer("7")),
            Cell(position: .init(x: 7, y: 7), type: .integer("5")),
            Cell(position: .init(x: 8, y: 7), type: .integer("5"))
        ])
    }
    
    static var number664: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 1, y: 9), type: .integer("6")),
            Cell(position: .init(x: 2, y: 9), type: .integer("6")),
            Cell(position: .init(x: 3, y: 9), type: .integer("4"))
        ])
    }
    
    static var number598: Self {
        PartNumber(cells: [
            Cell(position: .init(x: 5, y: 9), type: .integer("5")),
            Cell(position: .init(x: 6, y: 9), type: .integer("9")),
            Cell(position: .init(x: 7, y: 9), type: .integer("8"))
        ])
    }

}
