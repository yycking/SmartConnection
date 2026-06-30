// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmartConnection",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SmartConnection",
            targets: [
                "SmartConnection",
                "Elian",
            ]
        ),
    ],
    targets: [
        .binaryTarget(name: "Elian", path: "Frameworks/SmartConnection.xcframework"),
        .target(name: "SmartConnection",
                dependencies: ["Elian"],
                linkerSettings: [.linkedLibrary("c++")]),
    ]
)
