// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "featureMain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FeatureMain", targets: ["FeatureMain"])
    ],
    dependencies: [
        .package(path: "../navigation"),
        .package(path: "../featureRepos"),
    ],
    targets: [
        .target(
            name: "FeatureMain",
            dependencies: [
                .product(name: "FeatureRepos", package: "featureRepos"),
                .product(name: "Navigation", package: "navigation"),
            ],
            path: "Sources/featureMain"
        ),
    ]
)
