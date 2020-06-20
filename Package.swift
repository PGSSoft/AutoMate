import PackageDescription

let package = Package(
    name: "AutoMate",
    platforms: [
        .macOS("10.12"),
        .iOS("9.3"),
        .tvOS("9.2")
    ],
    products: [
        .library(name: "AutoMate", targets: ["AutoMate"])
    ],
    targets: [
        .target(
            name: "AutoMate",
            path: "AutoMate")
    ]
)
