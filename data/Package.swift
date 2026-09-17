// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "data",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DataAuth", targets: ["DataAuth"])
    ],
    dependencies: [
        .package(path: "../domain")
    ],
    targets: [
        .target(name: "Network", path: "Sources/network"),
        
        .target(
            name: "DataAuth",
            dependencies: [
                .product(name: "DomainAuth", package: "domain")
            ],
            path: "Sources/auth"
        ),
    ]
)
