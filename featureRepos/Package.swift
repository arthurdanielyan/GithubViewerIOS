// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "featureRepos",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FeatureRepos", targets: ["FeatureRepos"])
    ],
    dependencies: [
        .package(path: "../domain"),
        .package(path: "../navigation"),
    ],
    targets: [
        .target(
            name: "FeatureRepos",
            dependencies: [
//                .product(name: "DomainRepos", package: "domain"),
                .product(name: "Navigation", package: "navigation"),
            ],
            path: "Sources/featureRepos"
        ),
    ]
)
