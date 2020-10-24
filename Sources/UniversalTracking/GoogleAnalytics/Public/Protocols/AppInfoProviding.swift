//
//  AppInfoProviding.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

public protocol AppInfoProviding {

    var applicationName: String { get }
    var applicationIdentifier: String { get }
    var applicationVersion: String { get }
    var applicationBuild: String { get }
}
