// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "featureLogin",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FeatureLogin", targets: ["FeatureLogin"])
    ],
    dependencies: [
        .package(path: "../domain"),
        .package(path: "../navigation"),
    ],
    targets: [
        .target(
            name: "FeatureLogin",
            dependencies: [
                .product(name: "DomainAuth", package: "domain"),
                .product(name: "Navigation", package: "navigation"),
            ],
            path: "Sources/featureLogin"
        ),
    ]
)
