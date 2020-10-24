//
//  Hit.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum HitType: String {
        case pageview, screenview, event, transaction, item, social, exception, timing
    }

    public enum Hit {

        /**
         The type of hit. Must be one of
         * pageview
         * screenview
         * event
         * transaction
         * item
         * social
         * exception
         * timing
         - Parameter value: String
         - Important Required for all hit types
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#t
         */
        public static func hitType(
            _ value: HitType
        ) -> GAParam {
            .init(parameter: "t", value: value.rawValue)
        }

        /**
         Specifies that a hit be considered non-interactive.
         - Parameter value: Bool
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ni
         */
        public static func nonInteractionHit(
            _ value: Bool
        ) -> GAParam {
            .init(parameter: "ni", value: value)
        }
    }
}
