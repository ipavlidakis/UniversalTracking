//
//  Bundle+AppInfoProviding.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension Bundle: AppInfoProviding {

    public var applicationName: String { object(forInfoDictionaryKey: "CFBundleName") as? String ?? "(not set)" }
    public var applicationIdentifier: String { object(forInfoDictionaryKey: "CFBundleIdentifier") as? String ?? "(not set)" }
    public var applicationVersion: String { object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "(not set)" }
    public var applicationBuild: String { object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "(not set)" }
}
