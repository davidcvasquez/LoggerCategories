// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LoggerCategories",
    platforms: [
        .macOS(.v14),
        .iOS(.v15)
    ],
    products: [
        .library(name: "LoggerCategories", targets: ["LoggerCategories"])
    ],
    dependencies: [
        // DocC plugin (command plugin that adds `generate-documentation`)
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.0")
    ],
    targets: [
        .target(
            name: "LoggerCategories",
            dependencies: [],
            path: "Sources/LoggerCategories"
        ),
        .testTarget(
            name: "LoggerCategoriesTests",
            dependencies: ["LoggerCategories"]
        )
    ]
)
