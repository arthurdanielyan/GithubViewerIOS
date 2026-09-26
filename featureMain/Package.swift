// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "featureMain",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "featureMain", targets: ["FeatureMain"])
    ],
    dependencies: [
        .package(path: "../domain"),
        .package(path: "../navigation"),
    ],
    targets: [
        .target(
            name: "FeatureMain",
            dependencies: [
                .product(name: "Navigation", package: "navigation"),
            ],
            path: "Sources/featureMain"
        ),
    ]
)
