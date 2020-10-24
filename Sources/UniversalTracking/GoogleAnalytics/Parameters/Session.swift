//
//  Session.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum Session {

        /**
         Used to control the session duration. A value of 'start' forces a new session to start with this hit
         and 'end' forces the current session to end with this hit. All other values are ignored.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sc
         */
        public static func sessionControl(
            _ value: String
        ) -> GAParam {
            .init(parameter: "sc", value: value)
        }

        /**
         The IP address of the user. This should be a valid IP address in IPv4 or IPv6 format. It will always
         be anonymized just as though &aip (anonymize IP) had been used.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#uip
         */
        public static func ipOverride(
            _ value: String
        ) -> GAParam {
            .init(parameter: "uip", value: value)
        }

        /**
         The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand
         crafting your own agent could break at any time.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ua
         */
        public static func userAgentOverride(
            _ value: String
        ) -> GAParam {
            .init(parameter: "ua", value: value)
        }

        /**
         The geographical location of the user. The geographical ID should be a two letter country code or
         a criteria ID representing a city or region (see http://developers.google.com/analytics/devguides/collection/protocol/v1/geoid).
         This parameter takes precedent over any location derived from IP address, including the
         IP Override parameter. An invalid code will result in geographical dimensions to be set to '(not set)'.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#geoid
         */
        public static func geographicalOverride(
            _ value: String
        ) -> GAParam {
            .init(parameter: "geoid", value: value)
        }
    }
}
