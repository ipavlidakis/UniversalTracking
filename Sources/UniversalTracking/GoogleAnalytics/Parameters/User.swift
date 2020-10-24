//
//  User.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension GAParam {

    public enum User {

        /**
         This field is required if User ID (uid) is not specified in the request. This pseudonymously identifies
         a particular user, device, or browser instance. For the web, this is generally stored as a first-party
         \cookie with a two-year expiration. For mobile apps, this is randomly generated for each
         particular instance of an application install. The value of this field should be a random
         UUID (version 4) as described in http://www.ietf.org/rfc/rfc4122.txt.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cid
         */
        public static func clientID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "cid", value: value)
        }

        /**
         This field is required if Client ID (cid) is not specified in the request. This is intended to be a known
         identifier for a user provided by the site owner/library user. It must not itself be PII (personally
         identifiable information). The value should never be persisted in Google Analytics cookies or
         other Analytics provided storage.
         - Parameter value: String
         - Note: Supported Hit Types: all
         - SeeAlso: https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#uid
         */
        public static func userID(
            _ value: String
        ) -> GAParam {
            .init(parameter: "uid", value: value)
        }
    }
}
