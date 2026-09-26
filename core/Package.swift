// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "core",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Core", targets: ["Core"])
    ],
    targets: [
        .target(name: "Core", path: "Sources/core"),
    ]
)
