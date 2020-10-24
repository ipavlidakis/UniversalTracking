//
//  TrackingEvent.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

struct TrackingEvent {

    let parameters: [GAParam]
}

extension TrackingEvent {

    static func forScreenView(
        appName: String,
        appVersion: String,
        appIdentifier: String,
        screenClass: String,
        screenTitle: String,
        additionalParamaters: [GAParam] = []
    ) -> TrackingEvent {
        let requiredParameters = [
            GAParam.Hit.hitType(.screenview),
            GAParam.Apps.applicationName(appName),
            GAParam.Apps.applicationVersion(appVersion),
            GAParam.Apps.applicationID(appIdentifier),
            GAParam.ContentInformation.documentPath("/\(screenClass)"),
            GAParam.ContentInformation.documentTitle(screenTitle),
        ]

        return TrackingEvent(
            parameters: requiredParameters.combineUniquely(with: additionalParamaters)
        )
    }

    static func forPageView(
        appIdentifier: String,
        screenClass: String,
        screenTitle: String,
        additionalParamaters: [GAParam] = []
    ) -> TrackingEvent {
        let requiredParameters = [
            GAParam.Hit.hitType(.pageview),
            GAParam.ContentInformation.documentHostName(appIdentifier),
            GAParam.ContentInformation.documentPath("/\(screenClass)"),
            GAParam.ContentInformation.documentTitle(screenTitle),
        ]

        return TrackingEvent(
            parameters: requiredParameters.combineUniquely(with: additionalParamaters)
        )
    }

    static func forSession(
        start: Bool,
        appIdentifier: String,
        additionalParamaters: [GAParam] = []
    ) -> TrackingEvent {
        let requiredParameters = [
            GAParam.Session.sessionControl(start ? "start" : "end"),
            GAParam.ContentInformation.documentLocationURL(appIdentifier),

        ]

        return TrackingEvent(
            parameters: requiredParameters.combineUniquely(with: additionalParamaters)
        )
    }

    static func forEvent(
        action: String,
        category: String = "universal",
        label: String? = nil,
        value: Int? = nil,
        additionalParamaters: [GAParam] = []
    ) -> TrackingEvent {
        var requiredParameters = [
            GAParam.Hit.hitType(.event),
            GAParam.Events.eventCategory(category),
            GAParam.Events.eventAction(action),
        ]

        if let label = label {
            requiredParameters.append(GAParam.Events.eventLabel(label))
        }

        if let value = value {
            requiredParameters.append(GAParam.Events.eventValue(value))
        }

        return TrackingEvent(
            parameters: requiredParameters.combineUniquely(with: additionalParamaters)
        )
    }

    static func forException(
        description: String,
        isFatal: Bool = true,
        additionalParamaters: [GAParam] = []
    ) -> TrackingEvent {
        let requiredParameters = [
            GAParam.Hit.hitType(.exception),
            GAParam.Exceptions.exceptionDescription(description),
            GAParam.Exceptions.isExceptionFatal(isFatal),
        ]

        return TrackingEvent(
            parameters: requiredParameters.combineUniquely(with: additionalParamaters)
        )
    }
}
