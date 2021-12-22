// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//
//  Copyright (c) super team.
//

import PackageDescription

let package = Package(
    name: "StyleOrganizer",
    products: [
        .library(
            name: "StyleOrganizer",
            targets: ["StyleOrganizer"]),
    ],
    targets: [
        .target(
            name: "StyleOrganizer",
            path: "StyleOrganizer/Classes")
    ]
)
