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
        .binaryTarget(name: "Elian", url: "https://github.com/yycking/SmartConnection/releases/download/v1/SmartConnection.xcframework.zip", checksum: "f9f8fc72abcf3f8603b4baa884dcebeaa55aa8ec6245ffc8e81ef6311b0edcd6"),
        .target(name: "SmartConnection",
                dependencies: ["Elian"],
                linkerSettings: [.linkedLibrary("c++")]),
    ]
)
