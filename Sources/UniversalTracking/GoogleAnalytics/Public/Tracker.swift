//
//  Tracker.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

fileprivate func _clientIdentifier() -> String {

    let key = "universal_track_ga_client_identifier"
    guard let clientIdentifer = UserDefaults.standard.string(forKey: key) else {
        let newClientIdentifier = UUID().uuidString
        UserDefaults.standard.setValue(newClientIdentifier, forKey: key)
        return newClientIdentifier
    }
    return clientIdentifer
}

extension UniversalGoogleAnalytics {

    public final class Tracker: NSObject {

        public static var `default`: Tracker = Tracker()

        // Configuration
        public var trackerID: String? { didSet { _requiredParameters = nil } }
        public var annonymizeIP: Bool = true { didSet { _requiredParameters = nil } }

        // Providers
        public var appInfoProvider: AppInfoProviding = Bundle.main { didSet { _requiredParameters = nil } }
        public var deviceInfoProvider: DeviceInfoProviding = DeviceInfoProvider() { didSet { _requiredParameters = nil } }
        public var userAgentProvider: UserAgentProviding = UserAgentProvider()
        public var clientIdentifier: String {
            willSet { assert(clientIdentifier.isEmpty) }
            didSet { _requiredParameters = nil }
        }

        private let session: URLSession
        private let maxNoOfElements: Int
        private let maxFlushInterval: TimeInterval

        private lazy var baseURL = URL(string: "https://www.google-analytics.com/")!
        private lazy var collectURL = baseURL.appendingPathComponent("collect")
        private lazy var batchURL = baseURL.appendingPathComponent("batch")

        private var operationQueue: OperationQueue!
        private var trackingEventsBuffer: ArrayBuffer<TrackingEvent>!

        private var _requiredParameters: [GAParam]?
        private var requiredParameters: [GAParam]! {
            get {
                if _requiredParameters == nil, let trackerID = trackerID {
                    _requiredParameters = [
                        GAParam.General.protocolVersion(),
                        GAParam.General.measurementID(trackerID),
                        GAParam.Apps.applicationID(appInfoProvider.applicationIdentifier),
                        GAParam.User.clientID(clientIdentifier),
                        GAParam.Apps.applicationName(appInfoProvider.applicationName),
                        GAParam.Apps.applicationVersion("\(appInfoProvider.applicationVersion) (\(appInfoProvider.applicationBuild))"),
                        GAParam.Session.userAgentOverride(userAgentProvider.userAgent),
                        GAParam.SystemInfo.userLanguage(deviceInfoProvider.userLanguage),
                        GAParam.SystemInfo.screenResolution(deviceInfoProvider.screenResolution),
                        GAParam.General.anonymizeIP(annonymizeIP),
                    ]
                }
                return _requiredParameters!
            }
        }

        public init(
            _ session: URLSession = .shared,
            maxNoOfElements: Int = 20,
            maxFlushInterval: TimeInterval = 3
        ) {
            self.session = session
            self.maxNoOfElements = maxNoOfElements
            self.maxFlushInterval = maxFlushInterval
            self.clientIdentifier = _clientIdentifier()

            super.init()

            self.operationQueue = OperationQueue()
            operationQueue.maxConcurrentOperationCount = 1
            operationQueue.qualityOfService = .default

            self.trackingEventsBuffer = ArrayBuffer<TrackingEvent>(
                maxNoOfElements: maxNoOfElements,
                maxFlushInterval: maxFlushInterval,
                flushClosure: { [weak self] elements in self?.operationQueue.addOperation { [weak self] in self?.batch(elements) } })
        }
    }
}

extension UniversalGoogleAnalytics.Tracker {

    private func collect(
        _ trackingEvent: TrackingEvent
    ) {
        guard trackerID != nil else {
            assertionFailure("You must first configure the tracker ID")
            return
        }

        let parameters = self.requiredParameters.combineUniquely(with: trackingEvent.parameters)

        let queryItems = parameters.map { URLQueryItem(name: $0.parameter, value: $0.value) }

        var request = URLRequest(
            url: collectURL.appenQueryItems(queryItems),
            cachePolicy: .reloadIgnoringCacheData,
            timeoutInterval: 3
        )

        request.httpMethod = "GET"

        session.dataTask(with: request) { (data, response, error) in
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                // TODO retry
                return
            }
            debugPrint("Successfully a single tracking event")
        }.resume()
    }

    private func batch(
        _ trackingEvents: [TrackingEvent]
    ) {
        guard trackerID != nil else {
            assertionFailure("You must first configure the tracker ID")
            return
        }

        let parameters = self.requiredParameters!
        let body = trackingEvents
            .map { parameters.combineUniquely(with: $0.parameters) }
            .map { $0.map { "\($0.parameter)=\($0.value)" } }
            .map { $0.joined(separator: "&") }
            .joined(separator: "\n")

        debugPrint("Batch of \(trackingEvents.endIndex) - START")
        debugPrint(body)
        debugPrint("Batch of \(trackingEvents.endIndex) - END")

        var request = URLRequest(
            url: batchURL,
            cachePolicy: .reloadIgnoringCacheData,
            timeoutInterval: 15
        )

        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)

        session.dataTask(with: request) { (data, response, error) in
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                // TODO retry
                return
            }
            debugPrint("Successfully tracked \(trackingEvents.endIndex)")
        }.resume()
    }
}

extension UniversalGoogleAnalytics.Tracker {

    public func logScreenView(
        screenClass: String
    ) {
        let trackingEvent = TrackingEvent.forScreenView(
            screenClass: screenClass
        )
        trackingEventsBuffer.append(trackingEvent)
    }

    public func logStartSession(
    ) {
        let trackingEvent = TrackingEvent.forSession(
            start: true,
            appIdentifier: appInfoProvider.applicationIdentifier
        )

        trackingEventsBuffer.append(trackingEvent)
    }

    public func logEndSession(
    ) {
        let trackingEvent = TrackingEvent.forSession(
            start: false,
            appIdentifier: appInfoProvider.applicationIdentifier
        )

        trackingEventsBuffer.append(trackingEvent)
    }

    public func logEvent(
        action: String
    ) {
        let trackingEvent = TrackingEvent.forEvent(
            action: action
        )

        trackingEventsBuffer.append(trackingEvent)
    }

    public func logCrash(
        _ exception: NSException
    ) {
        let trackingEvent = TrackingEvent.forException(
            description: exception.description,
            isFatal: true
        )

        trackingEventsBuffer.append(trackingEvent)
    }

    public func logNonFatalException(
        _ exception: NSException
    ) {
        let trackingEvent = TrackingEvent.forException(
            description: exception.description,
            isFatal: false
        )

        trackingEventsBuffer.append(trackingEvent)
    }
}
