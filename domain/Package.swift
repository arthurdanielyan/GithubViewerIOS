// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DomainAuth", targets: ["DomainAuth"])
    ],
    targets: [
        .target(name: "DomainAuth", path: "Sources/auth"),
    ]
)
