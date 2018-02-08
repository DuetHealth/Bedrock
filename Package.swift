// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Bedrock",
    products: [.library(name: "Bedrock", targets: ["Bedrock"]),],
    targets: [.target(name: "Bedrock",dependencies: [], path:"Bedrock"),]
)
