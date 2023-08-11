// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CodelatoSwift",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "CodelatoSwift",
      targets: ["CodelatoSwift"]
    ),
    .library(
      name: "CodelatoIOS",
      targets: ["CodelatoIOS"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
    .package(url: "https://github.com/bhlvoong/LBTATools", from: "1.0.0"),
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.4.0")),
  ],
  targets: [
    .target(
      name: "CodelatoSwift",
      dependencies: [
        "Alamofire",
        "CryptoSwift"
      ]
    ),
    .testTarget(
      name: "CodelatoSwiftTests",
      dependencies: ["CodelatoSwift"]
    ),
    .target(
      name: "CodelatoIOS",
      dependencies: [
        "CodelatoSwift",
        "Alamofire",
        "LBTATools"
      ],
      resources: [
        .process("Resources")
      ]
    ),
  .testTarget(
      name: "CodelatoIOSTests",
      dependencies: ["CodelatoIOS"]
    )
  ]
)
