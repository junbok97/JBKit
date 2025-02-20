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
        .library(name: "MoyaExt", targets: ["MoyaExt"]),
        .library(name: "RIBsExt", targets: ["RIBsExt"])
    ],
    dependencies: [
        .package(url: "https://github.com/uber/RIBs-iOS.git", from: "0.16.3"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
    ],
    targets: [
        .target(name: "JBExtension"),
        .target(name: "JBManager"),
        .target(name: "JBUtil"),
        .target(
            name: "MoyaExt",
            dependencies: [
                .product(name: "Moya", package: "Moya")
            ]
        ),
        .target(
            name: "RIBsExt",
            dependencies: [
                .product(name: "RIBs", package: "RIBs-iOS")
            ]
        )
    ]
)
