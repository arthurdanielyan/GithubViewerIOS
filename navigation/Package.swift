// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "navigation",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Navigation", targets: ["Navigation"])
    ],
    targets: [
        .target(name: "Navigation", path: "Sources/navigation"),
    ]
)
