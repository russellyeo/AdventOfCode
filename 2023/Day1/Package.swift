// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day1",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(
            name: "Day1",
            targets: ["Day1"]
        ),
        .library(
            name: "Solution",
            targets: ["Solution"]
        )
    ],
    targets: [
        .executableTarget(
            name: "Day1",
            dependencies: ["Solution"]
        ),
        .target(
            name: "Solution"
        ),
        .testTarget(
            name: "SolutionTests",
            dependencies: ["Solution"]
        )
    ]
)
