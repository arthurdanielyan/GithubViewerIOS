// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "featureHome",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FeatureHome", targets: ["FeatureHome"])
    ],
    dependencies: [
        .package(path: "../navigation"),
        .package(path: "../featureRepos"),
    ],
    targets: [
        .target(
            name: "FeatureHome",
            dependencies: [
                .product(name: "FeatureRepos", package: "featureRepos"),
                .product(name: "Navigation", package: "navigation"),
            ],
            path: "Sources/featureHome"
        ),
    ]
)
