//
//  Array+Convenience.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension Array where Element: Hashable {

    func combineUniquely(
        with otherArray: [Element]
    ) -> [Element] {

        if isEmpty { return otherArray }
        else if otherArray.isEmpty { return self }

        let objectSet = Set<Element>(self + otherArray)
        return Array(objectSet)
    }
}
