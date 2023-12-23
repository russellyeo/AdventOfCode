@testable import Day5
import Foundation

extension Almanac {
    static var example: Almanac {
        Almanac(
            seeds: [79, 14, 55, 13],
            maps: [
                Map(
                    name: "seed-to-soil",
                    instructions: [
                        Instruction(destinationRange: 50..<52, sourceRange: 98..<100),
                        Instruction(destinationRange: 52..<100, sourceRange: 50..<98)
                    ]
                ),
                Map(
                    name: "soil-to-fertilizer",
                    instructions: [
                        Instruction(destinationRange: 0..<37, sourceRange: 15..<52),
                        Instruction(destinationRange: 37..<39, sourceRange: 52..<54),
                        Instruction(destinationRange: 39..<54, sourceRange: 0..<15),
                    ]
                ),
                Map(
                    name: "fertilizer-to-water",
                    instructions: [
                        Instruction(destinationRange: 49..<57, sourceRange: 53..<61),
                        Instruction(destinationRange: 0..<42, sourceRange: 11..<53),
                        Instruction(destinationRange: 42..<49, sourceRange: 0..<7),
                        Instruction(destinationRange: 57..<61, sourceRange: 7..<11)
                    ]
                ),
                Map(
                    name: "water-to-light",
                    instructions: [
                        Instruction(destinationRange: 88..<95, sourceRange: 18..<25),
                        Instruction(destinationRange: 18..<88, sourceRange: 25..<95)
                    ]
                ),
                Map(
                    name: "light-to-temperature",
                    instructions: [
                        Instruction(destinationRange: 45..<68, sourceRange: 77..<100),
                        Instruction(destinationRange: 81..<100, sourceRange: 45..<64),
                        Instruction(destinationRange: 68..<81, sourceRange: 64..<77)
                    ]
                ),
                Map(
                    name: "temperature-to-humidity",
                    instructions: [
                        Instruction(destinationRange: 0..<1, sourceRange: 69..<70),
                        Instruction(destinationRange: 1..<70, sourceRange: 0..<69)
                    ]
                ),
                Map(
                    name: "humidity-to-location",
                    instructions: [
                        Instruction(destinationRange: 60..<97, sourceRange: 56..<93),
                        Instruction(destinationRange: 56..<60, sourceRange: 93..<97)
                    ]
                )
            ]
        )
    }
}
