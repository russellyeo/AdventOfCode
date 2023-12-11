//
//  File.swift
//  
//
//  Created by Russell Yeo on 11/12/2023.
//

public struct PartNumber: Equatable {
    /// The cells in the part number
    let cells: [Cell]
    
    /// The integer value of the part number
    var value: Int {
        let string = cells.reduce(into: "", { accumulator, cell in
            guard case .integer(let value) = cell.type else { return }
            accumulator += value
        })
        return Int(string) ?? 0
    }
    
    /// The region of the part number in the grid
    var ownRegion: Region {
        Region { position in cells.map(\.position).contains(where: { $0 == position }) }
    }
    
    /// The surrounding region with given range away from the part itself (chessboard distance)
    func surroundingRegion(range: Int) -> Region {
        cells.map(\.position).reduce(Region.empty(), { result, position in
            result.union(with: Region.square(range: range).shift(by: position))
        })
        .subtract(ownRegion)
    }
}

