//
//  UserAgentProvider.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 25/10/2020.
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

#if SUPPORTS_WEBKIT
import WebKit
#endif


final class UserAgentProvider: UserAgentProviding {

    lazy var userAgent: String = {
        #if os(OSX)
        let osVersion = ProcessInfo.processInfo.operatingSystemVersionString
        let versionString = osVersion.replacingOccurrences(of: ".", with: "_")
        let fallbackAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X \(versionString)) AppleWebKit/603.2.4 (KHTML, like Gecko)"
        #elseif os(watchOS)
        let currentDevice = WKInterfaceDevice.current()
        let osVersion = currentDevice.systemVersion.replacingOccurrences(of: ".", with: "_")
        let fallbackAgent = "atc/1.0 watchOS/\(osVersion) model/Watch5,2 hwp/t8006 build/17S84 (6; dt:201)"
        #elseif os(tvOS)
        let currentDevice = UIDevice.current
        let osVersion = currentDevice.systemVersion.replacingOccurrences(of: ".", with: "_")
        let fallbackAgent = "AppleTV/tvOS/\(osVersion)"
        #elseif targetEnvironment(macCatalyst)
        let currentDevice = UIDevice.current
        let osVersion = currentDevice.systemVersion.replacingOccurrences(of: ".", with: "_")
        let fallbackAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X \(osVersion)) AppleWebKit/603.2.4 (KHTML, like Gecko)"
        #else
        let currentDevice = UIDevice.current
        let osVersion = currentDevice.systemVersion.replacingOccurrences(of: ".", with: "_")
        let fallbackAgent = "Mozilla/5.0 (\(currentDevice.model); CPU iPhone OS \(osVersion) like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13T534YI"
        #endif

        #if SUPPORTS_WEBKIT
        // must be captured in instance variable to avoid invalidation
        webViewForUserAgentDetection = WKWebView() /
            webViewForUserAgentDetection?.loadHTMLString("<html></html>", baseURL: nil)
        webViewForUserAgentDetection?.evaluateJavaScript("navigator.userAgent") { [weak self] result, _ in
            guard let self = self else { return }
            if let agent = result as? String {
                self.userAgent = agent
            }
            self.webViewForUserAgentDetection = nil
        }
        return fallbackAgent
        #else
        return fallbackAgent
        #endif
    } ()
}
