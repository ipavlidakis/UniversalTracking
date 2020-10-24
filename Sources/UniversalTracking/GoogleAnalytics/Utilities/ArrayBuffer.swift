//
//  ArrayBuffer.swift
//  UniversalTracking
//
//  Created by Ilias Pavlidakis on 24/10/2020.
//

import Foundation

final class ArrayBuffer<Element> {

    private let maxNoOfElements: Int
    private let maxFlushInterval: TimeInterval
    private let flushClosure: (([Element]) -> ())
    private let lock = DispatchSemaphore(value: 1)

    private var _elements: [Element] = []
    private var timer: Timer!

    init(
        maxNoOfElements: Int,
        maxFlushInterval: TimeInterval,
        flushClosure: @escaping (([Element]) -> ())
    ) {
        self.maxNoOfElements = maxNoOfElements
        self.maxFlushInterval = maxFlushInterval
        self.flushClosure = flushClosure
        self.timer = Timer.scheduledTimer(withTimeInterval: maxFlushInterval, repeats: true, block: self.flush)
    }

    func append(_ element: Element) {
        lock.wait()
        _elements.append(element)
        if _elements.count >= maxNoOfElements {
            let copyElements = _elements
            _elements = []
            timer.invalidate()
            lock.signal()
            flush(copyElements)
        } else {
            lock.signal()
        }
    }

    private func flush(
        _ timer: Timer
    ) {
        lock.wait()
        let copyElements = _elements
        _elements = []
        lock.signal()
        flush(copyElements)
    }

    private func flush(
        _ elements: [Element]
    ) {
        guard !elements.isEmpty else { return }
        debugPrint("Will flush arrayBuffer with \(elements.endIndex) elements")
        flushClosure(elements)
    }
}
