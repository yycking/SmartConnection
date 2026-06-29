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
        .binaryTarget(name: "Elian", url: "https://github.com/yycking/SmartConnection/releases/download/v1/SmartConnection.xcframework.zip", checksum: "d85a4189da400c9477d63b4d95313332059cb9f131b87cde627e90a81d39982d"),
        .target(name: "SmartConnection",
                dependencies: ["Elian"],
                linkerSettings: [.linkedLibrary("c++")]),
    ]
)
