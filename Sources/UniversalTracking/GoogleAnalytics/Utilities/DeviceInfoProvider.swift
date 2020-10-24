//
//  DeviceInfoProvider.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(watchOS)
import UIKit
import WatchKit
#elseif os(OSX)
import AppKit
#endif


final class DeviceInfoProvider: DeviceInfoProviding {

    lazy var userLanguage: String = {
        guard let locale = Locale.preferredLanguages.first, locale.count > 0
        else { return "(not set)" }
        return locale
    }()

    lazy var screenResolution: String = {
        #if os(iOS) || os(tvOS)
        let size = UIScreen.main.nativeBounds.size
        #elseif os(watchOS)
        let size =  WKInterfaceDevice.current().screenBounds
        #elseif os(OSX)
        let size = NSScreen.main?.frame.size ?? .zero
        #endif

        return "\(size.width)x\(size.height)"
    }()
}
