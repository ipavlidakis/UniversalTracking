//
//  TrafficSources.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum TrafficSources {

        /**
         Specifies which referral source brought traffic to a website. This value is also used to compute
         the traffic source. The format of this value is a URL.
         - Parameter value: String
         - Important Max Length: 2048 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cid
         */
        public static func documentReferrer(
            _ value: String
        ) -> GAParam {
            .init(parameter: "dr", value: value, validator: GAParam.utf8BytesLengthValidator(2048))
        }

        /**
         Specifies the campaign name.
         - Parameter value: String
         - Important Max Length: 100 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cn
         */
        public static func campaignName(
        _ value: String
        ) -> GAParam {
            .init(parameter: "cn", value: value, validator: GAParam.utf8BytesLengthValidator(100))
        }

        /**
         Specifies the campaign source
         - Parameter value: String
         - Important Max Length: 100 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cs
         */
        public static func campaignSource(
        _ value: String
        ) -> GAParam {
            .init(parameter: "cs", value: value, validator: GAParam.utf8BytesLengthValidator(100))
        }

        /**
         Specifies the campaign medium.
         - Parameter value: String
         - Important Max Length: 50 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cm
         */
        public static func campaignMedium(
        _ value: String
        ) -> GAParam {
            .init(parameter: "cm", value: value, validator: GAParam.utf8BytesLengthValidator(50))
        }

        /**
         Specifies the campaign keyword.
         - Parameter value: String
         - Important Max Length: 500 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ck
         */
        public static func campaignKeyword(
        _ value: String
        ) -> GAParam {
            .init(parameter: "ck", value: value, validator: GAParam.utf8BytesLengthValidator(500))
        }

        /**
         Specifies the campaign content.
         - Parameter value: String
         - Important Max Length: 500 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cc
         */
        public static func campaignContent(
        _ value: String
        ) -> GAParam {
            .init(parameter: "cc", value: value, validator: GAParam.utf8BytesLengthValidator(500))
        }

        /**
         Specifies the campaign ID.
         - Parameter value: String
         - Important Max Length: 100 Bytes
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ci
         */
        public static func campaignID(
        _ value: String
        ) -> GAParam {
            .init(parameter: "ci", value: value, validator: GAParam.utf8BytesLengthValidator(100))
        }

        /**
         Specifies the Google Ad Id.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#gclid
         */
        public static func googleAdsID(
        _ value: String
        ) -> GAParam {
            .init(parameter: "gclid", value: value)
        }

        /**
         Specifies the Google Display Ads Id.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dclid
         */
        public static func googleDisplayAdsID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "dclid", value: value)
        }
    }
}
