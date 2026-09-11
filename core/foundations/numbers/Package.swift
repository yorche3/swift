// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Numbers",
    products: [
        .library(
            name: "Numbers",
            targets: ["Numbers"]
        )
    ],
    targets: [
        .target(
            name: "Numbers"
        ),
        .testTarget(
            name: "NumbersTests",
            dependencies: ["Numbers"]
        )
    ]
)
