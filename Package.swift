// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JBKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "JBExtension", targets: ["JBExtension"]),
        .library(name: "JBManager", targets: ["JBManager"]),
        .library(name: "JBUtil", targets: ["JBUtil"]),
        .library(name: "RIBsExt", targets: ["RIBsExt"])
    ],
    dependencies: [
        .package(url: "https://github.com/uber/RIBs-iOS", from: "0.16.3")
    ],
    targets: [
        .target(name: "JBExtension"),
        .target(name: "JBManager"),
        .target(name: "JBUtil"),
        .target(
            name: "RIBsUtil",
            dependencies: [
                .product(name: "RIBs", package: "RIBs")
            ]
        )
    ]
)
