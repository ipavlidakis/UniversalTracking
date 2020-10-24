//
//  General.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum General {

        /**
         The Protocol version. The current value is '1'. This will only change when there are changes made
         that are not backwards compatible.
         - Parameter value: String
         - Important: Non-optional field. required for every event
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#v
         */
        public static func protocolVersion(
            _ value: String = "1"
        ) -> GAParam {
            .init(parameter: "v", value: value, isOptional: false)
        }

        /**
         The measurement ID / web property ID. The format is UA-XXXX-Y. All collected data is associated
         by this ID.
         - Parameter value: String
         - Important: Non-optional field. required for every event
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#tid
         */
        public static func measurementID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "tid", value: value, isOptional: false)
        }

        /**
         When present, the IP address of the sender will be anonymized. For example, the IP will be
         anonymized if any of the following parameters are present in the payload: &aip=, &aip=0, or &aip=1
         - Parameter value: Bool
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aip
         */
        public static func anonymizeIP(
            _ value: Bool
        ) -> GAParam {
            .init(parameter: "aip", value: value)
        }

        /**
         Use this parameter to mark an event as disabled for advertising personalization, including for
         events from a property with a setting that otherwise permits ads personalization. For example, if a
         transaction is marked to disable advertising personalization, it won't be used when populating a
         remarketing audience for "past purchasers".
         - Parameter value: Bool
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#npa
         */
        public static func disablingAdvertisingPersonalization(
            _ value: Bool
        ) -> GAParam {
            .init(parameter: "npa", value: value)
        }

        /**
         Indicates the data source of the hit. Hits sent from analytics.js will have data source set to 'web';
         hits sent from one of the mobile SDKs will have data source set to 'app'.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ds
         */
        public static func datasource(
            _ value: String
        ) -> GAParam {
            .init(parameter: "ds", value: value)
        }

        /**
         Used to collect offline / latent hits. The value represents the time delta (in milliseconds) between
         when the hit being reported occurred and the time the hit was sent. The value must be greater
         than or equal to 0. Values greater than four hours may lead to hits not being processed.
         - Parameter value: Int
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#qt
         */
        public static func queueTime(
            _ value: Int
        ) -> GAParam {
            .init(parameter: "qt", value: value)
        }

        /**
         Used to send a random number in GET requests to ensure browsers and proxies don't cache hits.
         It should be sent as the final parameter of the request since we've seen some 3rd party internet
         filtering software add additional parameters to HTTP requests incorrectly. This value is not used
         in reporting.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#z
         */
        public static func cacheBuster(
            _ value: String
        ) -> GAParam {
            .init(parameter: "z", value: value)
        }
    }
}
