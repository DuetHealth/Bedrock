// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "Bedrock",
    products: [
        .library(name: "Bedrock", targets: ["Bedrock"]),
    ],
    targets: [
        .target(name: "Bedrock", dependencies: [], path: "Bedrock"),
        .testTarget(name: "BedrockTests", dependencies: ["Bedrock"]),
    ]
)
