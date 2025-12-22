// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmartConnection",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SmartConnection",
            targets: ["SmartConnection"]
        ),
    ],
    targets: [
        .binaryTarget(name: "SmartConnection", url: "https://github.com/yycking/SmartConnection/releases/download/release/SmartConnection.xcframework.zip", checksum: "f1a7ee4c09a343fb04205d4b106ff7797fe5dbe0d1be437af945407db38a4d65"),
    ]
)
