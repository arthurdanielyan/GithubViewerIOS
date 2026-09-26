// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "data",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DataAuth", targets: ["DataAuth"])
    ],
    dependencies: [
        .package(path: "../domain"),
        .package(path: "../network")
    ],
    targets: [
        .target(
            name: "DataAuth",
            dependencies: [
                .product(name: "DomainAuth", package: "domain"),
                .product(name: "Network", package: "network")
            ],
            path: "Sources/auth"
        ),
    ]
)
