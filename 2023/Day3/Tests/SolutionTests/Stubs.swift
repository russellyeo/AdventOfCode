@testable import Solution

extension Grid {
    static var example: Grid {
        .init(value: [
            [.integer("4"), .integer("6"), .integer("7"), .empty, .empty, .integer("1"), .integer("1"), .integer("4"), .empty, .empty],
            [.empty, .empty, .empty, .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .integer("3"), .integer("5"), .empty, .empty, .integer("6"), .integer("3"), .integer("3"), .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .symbol("#"), .empty, .empty, .empty],
            [.integer("6"), .integer("1"), .integer("7"), .symbol("*"), .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .symbol("+"), .empty, .integer("5"), .integer("8"), .empty],
            [.empty, .empty, .integer("5"), .integer("9"), .integer("2"), .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .integer("7"), .integer("5"), .integer("5"), .empty],
            [.empty, .empty, .empty, .symbol("$"), .empty, .symbol("*"), .empty, .empty, .empty, .empty],
            [.empty, .integer("6"), .integer("6"), .integer("4"), .empty, .integer("5"), .integer("9"), .integer("8"), .empty, .empty]
        ])
    }
}

extension PartNumber {
    static var number467: Self {
        PartNumber(
            value: 467,
            positions: [
                Position(x: 0, y: 0): "4",
                Position(x: 1, y: 0): "6",
                Position(x: 2, y: 0): "7"
            ]
        )
    }
    static var number114: Self {
        PartNumber(
            value: 114,
            positions: [
                Position(x: 5, y: 0): "1",
                Position(x: 6, y: 0): "1",
                Position(x: 7, y: 0): "4"
            ]
        )
    }
    
    static var number35: Self {
        PartNumber(
            value: 35,
            positions: [
                Position(x: 2, y: 2): "3",
                Position(x: 3, y: 2): "5"
            ]
        )
    }
    
    static var number633: Self {
        PartNumber(
            value: 633,
            positions: [
                Position(x: 6, y: 2): "6",
                Position(x: 7, y: 2): "3",
                Position(x: 8, y: 2): "3"
            ]
        )
    }
    
    static var number617: Self {
        PartNumber(
            value: 617,
            positions: [
                Position(x: 0, y: 4): "6",
                Position(x: 1, y: 4): "1",
                Position(x: 2, y: 4): "7"
            ]
        )
    }
    
    static var number58: Self {
        PartNumber(
            value: 58,
            positions: [
                Position(x: 7, y: 5): "5",
                Position(x: 8, y: 5): "8"
            ]
        )
    }
    
    static var number592: Self {
        PartNumber(
            value: 592,
            positions: [
                Position(x: 2, y: 6): "5",
                Position(x: 3, y: 6): "9",
                Position(x: 4, y: 6): "2"
            ]
        )
    }
    
    static var number755: Self {
        PartNumber(
            value: 755,
            positions: [
                Position(x: 6, y: 7): "7",
                Position(x: 7, y: 7): "5",
                Position(x: 8, y: 7): "5"
            ]
        )
    }
    
    static var number664: Self {
        PartNumber(
            value: 664,
            positions: [
                Position(x: 1, y: 9): "6",
                Position(x: 2, y: 9): "6",
                Position(x: 3, y: 9): "4"
            ]
        )
    }
    
    static var number598: Self {
        PartNumber(
            value: 598,
            positions: [
                Position(x: 5, y: 9): "5",
                Position(x: 6, y: 9): "9",
                Position(x: 7, y: 9): "8"
            ]
        )
    }
}
