//
//  ContentInformation.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum ContentInformation {

        /**
         Use this parameter to send the full URL (document location) of the
         page on which content resides. You can use the &dh and &dp parameters
         to override the hostname and path + query portions of the document
         location, accordingly. The JavaScript clients determine this parameter
         using the concatenation of the
         document.location.origin + document.location.pathname + document.location.search browser parameters.
         Be sure to remove any user authentication or other private information
         from the URL if present. For 'pageview' hits, either &dl or both &dh
         and &dp have to be specified for the hit to be valid.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dl
         */
        public static func documentLocationURL(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "dl",
                value: value,
                validator: GAParam.utf8BytesLengthValidator(2048)
            )
        }

        /**
         Specifies the hostname from which content was hosted.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dh
         */
        public static func documentHostName(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "dh",
                value: value,
                validator: GAParam.utf8BytesLengthValidator(100)
            )
        }

        /**
         The path portion of the page URL. Should begin with '/'.
         For 'pageview' hits, either &dl or both &dh and &dp have to be
         specified for the hit to be valid.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dp
         */
        public static func documentPath(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "dp",
                value: value,
                validator: GAParam.combineValidators([
                    GAParam.utf8BytesLengthValidator(2048),
                    GAParam.prefixValidator("/")
                ])
            )
        }

        /**
         The title of the page / document.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dt
         */
        public static func documentTitle(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "dt",
                value: value,
                validator: GAParam.utf8BytesLengthValidator(1500)
            )
        }

        /**
         This parameter is optional on web properties, and required on mobile
         properties for screenview hits, where it is used for the 'Screen Name'
         of the screenview hit. On web properties this will default to the
         unique URL of the page by either using the &dl parameter as-is or
         assembling it from &dh and &dp.
         - Parameter value: String. Value will be encoded with the .urlPathAllowed option
         - Important: Required for screenview hit type
         - Note: Supported Hit Types: screenview
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cd
         */
        public static func screenName(
            _ value: String
        ) -> GAParam {
            .init(
                parameter: "cd",
                value: value.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? value,
                validator: GAParam.utf8BytesLengthValidator(2048)
            )
        }
    }
}
