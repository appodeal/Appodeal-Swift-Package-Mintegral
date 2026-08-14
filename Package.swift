// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealMintegralAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealMintegralAdapter",
            targets: ["AppodealMintegralAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/Mintegral-official/MintegralAdSDK-Swift-Package", exact: "8.1.3"),
    ],
    targets: [
        .target(
            name: "AppodealMintegralAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "MintegralAdSDK", package: "MintegralAdSDK-Swift-Package"),
                .target(name: "AppodealMintegralAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealMintegralAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMintegralAdapter/8.1.3.0/AppodealMintegralAdapter.xcframework.zip",
            checksum: "3de1cf1a38e67fd6bdbe6f7768ba98bd6477f1d15cbc104c68c8ac9431ddf68b"
        ),

    ]
)
