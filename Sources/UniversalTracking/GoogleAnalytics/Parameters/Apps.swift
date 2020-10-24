//
//  Apps.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum Apps {

        /**
         Specifies the application name. This field is required for any hit
         that has app related data (i.e., app version, app ID, or
         app installer ID). For hits sent to web properties, this
         field is optional.
         - Parameter value: String. The value will be encoded with .urlQueryAllowed
         - Important: Max Length: 100 Bytes. Non-optional field
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#an
         */
        public static func applicationName(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "an",
                value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? value,
                validator: GAParam.utf8BytesLengthValidator(100)
            )
        }

        /**
         Application identifier.
         - Parameter value: String
         - Important: Max Length: 150 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aid
         */
        public static func applicationID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "aid", value: value, validator: GAParam.utf8BytesLengthValidator(150))
        }

        /**
         Specifies the application version.
         - Parameter value: String
         - Important: Max Length: 100 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#av
         */
        public static func applicationVersion(
            _ value: String
        ) -> GAParam {
            .init(parameter: "av", value: value, validator: GAParam.utf8BytesLengthValidator(100))
        }

        /**
         Application installer identifier.
         - Parameter value: String
         - Important: Max Length: 150 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aiid
         */
        public static func applicationInstallerID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "aiid", value: value, validator: GAParam.utf8BytesLengthValidator(150))
        }
    }
}
