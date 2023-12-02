// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day2",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(
            name: "Day2",
            targets: ["Day2"]
        ),
        .library(
            name: "Solution",
            targets: ["Solution"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0")
    ],
    targets: [
        .executableTarget(
            name: "Day2",
            dependencies: ["Solution"]
        ),
        .target(
            name: "Solution",
            dependencies: [
                .product(
                    name: "Parsing",
                    package: "swift-parsing"
                )
            ]
        ),
        .testTarget(
            name: "SolutionTests",
            dependencies: ["Solution"]
        )
    ]
)

