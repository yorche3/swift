// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "data_structures_basics",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "data_structures_basics",
            targets: ["data_structures_basics"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "data_structures_basics"
        ),
        .testTarget(
            name: "data_structures_basicsTests",
            dependencies: ["data_structures_basics"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
