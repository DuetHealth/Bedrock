// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Bedrock",
    platforms: [.iOS(.v8)],
    products: [.library(name: "Bedrock", targets: ["Bedrock"]),],
    dependencies: [
                   .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
                   .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
                  ],
    targets: [
              .target(name: "Bedrock", dependencies: [], path:"Bedrock"),
              .testTarget(name: "BedrockTests", dependencies: ["Bedrock", "Nimble", "Quick"], path: "BedrockTests/Sources"),
	     ]
)
