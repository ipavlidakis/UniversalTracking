//
//  URL+Convenience.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension URL {

    func appenQueryItems(
        _ queryItems: [URLQueryItem]
    ) -> URL {
        guard var components = URLComponents(string: self.absoluteString) else {
            assertionFailure("Failed to create URLComponents from url \(self)")
            return self
        }

        components.queryItems = (components.queryItems ?? []) + queryItems

        assert(components.url != nil)

        return components.url!
    }
}

