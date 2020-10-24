//
//  Exceptions.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum Exceptions {

        /**
         Specifies the description of an exception.
         - Parameter value: String
         - Important Required for all hit types
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#exd
         */
        public static func exceptionDescription(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "exd",
                value: value,
                validator: GAParam.utf8BytesLengthValidator(150)
            )
        }

        /**
         Specifies whether the exception was fatal.
         - Parameter value: Bool, Default value: true
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#exf
         */
        public static func isExceptionFatal(
            _ value: Bool = true
        ) -> GAParam {
            .init(parameter: "exf", value: value)
        }
    }
}
