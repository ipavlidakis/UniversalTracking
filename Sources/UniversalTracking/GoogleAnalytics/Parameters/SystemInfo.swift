//
//  SystemInfo.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum SystemInfo {

        /**
         Specifies the screen resolution.
         - Parameter value: String
         - Important Max Length: 20 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sr
         */
        public static func screenResolution(
            _ value: String
        ) -> GAParam {
            .init(parameter: "sr", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }

        /**
         Specifies the viewable area of the browser / device.
         - Parameter value: String
         - Important Max Length: 20 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#vp
         */
        public static func viewportSize(
            _ value: String
        ) -> GAParam {
            .init(parameter: "vp", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }

        /**
         Specifies the character set used to encode the page / document.
         - Parameter value: String
         - Important Max Length: 20 Bytes, Default Value: UTF-8
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#de
         */
        public static func documentEncoding(
            _ value: String = "UTF-8"
        ) -> GAParam {
            .init(parameter: "de", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }

        /**
         Specifies the screen color depth.
         - Parameter value: String
         - Important Max Length: 20 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sd
         */
        public static func screenColors(
            _ value: String
        ) -> GAParam {
            .init(parameter: "sd", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }

        /**
         Specifies the language.
         - Parameter value: String
         - Important Max Length: 20 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ul
         */
        public static func userLanguage(
            _ value: String
        ) -> GAParam {
            .init(parameter: "ul", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }

        /**
         Specifies whether Java was enabled.
         - Parameter value: Boolean
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#je
         */
        public static func javaEnabled(
            _ value: String
        ) -> GAParam {
            .init(parameter: "je", value: value)
        }

        /**
         Specifies the flash version.
         - Parameter value: String
         - Important Max Length: 20 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#fl
         */
        public static func flashVersion(
            _ value: String
        ) -> GAParam {
            .init(parameter: "fl", value: value, validator: GAParam.utf8BytesLengthValidator(20))
        }
    }
}
