// swift-tools-version:5.5
//
//  Package.swift
//
//  Copyright (c) super team.
//

import PackageDescription

let package = Package(name: "StyleOrganizer",
                      platforms: [.iOS(.v10)],
                      products: [.library(name: "StyleOrganizer", targets: ["StyleOrganizer"])],
                      targets: [
                                .target(name: "StyleOrganizer",
                                        path: "Source",
                                        exclude: ["Info.plist"],
                                        linkerSettings: [])
                                ],
                      swiftLanguageVersions: [.v5])
