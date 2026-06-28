// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cv_scan_secure_storage",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "cv-scan-secure-storage", targets: ["cv_scan_secure_storage"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "cv_scan_secure_storage",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [
                // If your plugin requires a privacy manifest, for example if it uses any required
                // reason APIs, update the PrivacyInfo.xcprivacy file to describe your plugin's
                // privacy impact, and then uncomment this line.
                // .process("PrivacyInfo.xcprivacy"),
            ]
        )
    ]
)
