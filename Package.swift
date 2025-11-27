// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIRippleEffect",
    platforms: [
      .iOS(.v17),
    ],
    products: [
        .library(
            name: "SwiftUIRippleEffect",
            targets: ["SwiftUIRippleEffect"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIRippleEffect",
            resources: [.process("Shaders/Ripple.metal")],
        ),
    ]
)
