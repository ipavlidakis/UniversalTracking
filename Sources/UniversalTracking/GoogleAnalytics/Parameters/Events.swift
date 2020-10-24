//
//  Events.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum Events {

        /**
         Specifies the event category
         - Parameter value: String. Must not be empty
         - Important: Max Length: 150 Bytes. Non-optional field for supported hit types.
         - Note: Supported Hit Types: event
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ec
         */
        public static func eventCategory(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "ec",
                value: value,
                validator: GAParam.combineValidators([
                    GAParam.utf8BytesLengthValidator(150),
                    GAParam.notEmptyValidator()
                ])
            )
        }

        /**
         Specifies the event action.
         - Parameter value: String. Must not be empty
         - Important: Max Length: 500 Bytes. Non-optional field for supported hit types.
         - Note: Supported Hit Types: event
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ea
         */
        public static func eventAction(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "ea",
                value: value,
                validator: GAParam.combineValidators([
                    GAParam.utf8BytesLengthValidator(500),
                    GAParam.notEmptyValidator()
                ])
            )
        }

        /**
         Specifies the event label.
         - Parameter value: String
         - Important: Max Length: 500 Bytes.
         - Note: Supported Hit Types: event
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#el
         */
        public static func eventLabel(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "el",
                value: value,
                validator: GAParam.utf8BytesLengthValidator(500)
            )
        }

        /**
         Specifies the event value.
         - Parameter value: Int. Value must be non-negative.
         - Note: Supported Hit Types: event
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ev
         */
        public static func eventValue(
            _ value: Int
        ) -> GAParam {
            .init(
                parameter: "ev",
                value: value
            )
        }
    }
}
