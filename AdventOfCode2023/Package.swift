// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdventOfCode2023",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(name: "CLI", targets: ["CLI"]),
        .library(name: "Day1", targets: ["Day1"]),
        .library(name: "Day2", targets: ["Day2"]),
        .library(name: "Day3", targets: ["Day3"]),
        .library(name: "Day4", targets: ["Day4"]),
        .library(name: "Day5", targets: ["Day5"]),
        .library(name: "PuzzleInput", targets: ["PuzzleInput"]),
        .library(name: "Solutions", targets: ["Solutions"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
    ],
    targets: [
        .executableTarget(
            name: "CLI",
            dependencies: [
                "Day1",
                "Day2",
                "Day3",
                "Day4",
                "Day5",
                "PuzzleInput",
                "Solutions",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .target(
            name: "PuzzleInput",
            dependencies: [],
            resources: [
                .copy("Files/1_challenge.txt"),
                .copy("Files/1_example.txt"),
                .copy("Files/2_challenge.txt"),
                .copy("Files/2_example.txt"),
                .copy("Files/3_challenge.txt"),
                .copy("Files/3_example.txt"),
                .copy("Files/4_challenge.txt"),
                .copy("Files/4_example.txt"),
                .copy("Files/5_challenge.txt"),
                .copy("Files/5_example.txt"),
            ]
        ),
        .target(
            name: "Solutions",
            dependencies: [
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .target(
            name: "Day1",
            dependencies: [
                "Solutions",
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .target(
            name: "Day2",
            dependencies: [
                "Solutions",
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .target(
            name: "Day3",
            dependencies: [
                "Solutions",
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .target(
            name: "Day4",
            dependencies: [
                "Solutions",
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .target(
            name: "Day5",
            dependencies: [
                "Solutions",
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .testTarget(name: "Day1Tests", dependencies: ["Day1"]),
        .testTarget(name: "Day2Tests", dependencies: ["Day2"]),
        .testTarget(name: "Day3Tests", dependencies: ["Day3"]),
        .testTarget(name: "Day4Tests", dependencies: ["Day4"]),
        .testTarget(name: "Day5Tests", dependencies: ["Day5"])
    ]
)
