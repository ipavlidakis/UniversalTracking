//
//  Parameter.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

extension UniversalGoogleAnalytics {

    public struct Parameter: Codable, Hashable {

        typealias Validator = (String) -> Bool
        static func utf8BytesLengthValidator(_ maxLengthInBytes: Int) -> Validator { { $0.utf8.count <= maxLengthInBytes } }
        static func prefixValidator(_ prefix: String) -> Validator { { $0.hasPrefix(prefix) } }
        static func notEmptyValidator() -> Validator { { !$0.isEmpty } }
        static func combineValidators(_ validators: [Validator]) -> Validator {
            return { value in
                return validators.reduce(true) { (currentResult, nextValidator) -> Bool in
                    guard currentResult else { return currentResult }
                    return nextValidator(value)
                }
            }
        }

        let parameter: String
        let value: String
        let isOptional: Bool

        init(
            parameter: String,
            value: String,
            isOptional: Bool = true,
            validator: Validator? = nil
        ) {
            if let _validator = validator {
                assert(_validator(value))
            }
            self.parameter = parameter
            self.value = value
            self.isOptional = isOptional
        }

        init(
            parameter: String,
            value: Bool,
            isOptional: Bool = true,
            validator: Validator? = nil
        ) {
            self.init(
                parameter: parameter,
                value: value ? "1" : "0",
                isOptional: isOptional,
                validator: validator
            )
        }

        init(
            parameter: String,
            value: Int,
            isOptional: Bool = true,
            validator: Validator? = nil
        ) {
            self.init(
                parameter: parameter,
                value: "\(value)",
                isOptional: isOptional,
                validator: validator
            )
        }
    }
}
