// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JBKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "JBExtension",
            targets: ["JBExtension"]
        ),
        .library(
            name: "JBManager",
            targets: ["JBManager"]
        ),
        .library(
            name: "JBUtil",
            targets: ["JBUtil"]
        ),
    ],
    targets: [
        .target(name: "JBExtension"),
        .target(name: "JBManager"),
        .target(name: "JBUtil"),
    ]
)
