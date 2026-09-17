// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "network",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Network", targets: ["Network"])
    ],
    dependencies: [
        .package(path: "../network")
    ],
    targets: [
        .target(name: "Network", path: "Sources/network"),
    ]
)
