// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Day3",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(
            name: "Day3",
            targets: ["Day3"]
        ),
        .library(
            name: "Solution",
            targets: ["Solution"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0"),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.1.2")
    ],
    targets: [
        .executableTarget(
            name: "Day3",
            dependencies: ["Solution"]
        ),
        .target(
            name: "Solution",
            dependencies: [
                .product(name: "CustomDump", package: "swift-custom-dump"),
                .product(name: "Parsing", package: "swift-parsing")
            ]
        ),
        .testTarget(
            name: "SolutionTests",
            dependencies: ["Solution"]
        )
    ]
)


