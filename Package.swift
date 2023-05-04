// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionHeaderKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CollectionHeaderKit",
            targets: ["CollectionHeaderKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CollectionHeaderKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "CollectionHeaderKitTests",
            dependencies: ["CollectionHeaderKit"]
        ),
    ]
)
