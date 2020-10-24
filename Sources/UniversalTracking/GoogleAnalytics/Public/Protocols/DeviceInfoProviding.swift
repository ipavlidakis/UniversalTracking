//
//  DeviceInfoProviding.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

public protocol DeviceInfoProviding {

    var userLanguage: String { get  }
    var screenResolution: String { get }
}
