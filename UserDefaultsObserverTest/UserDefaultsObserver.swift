//
//  UserDefaultsObserver.swift
//

import Foundation

public class UserDefaultsObserver<T> {
    public typealias KeyType = KeyPath<T, String>

    private let defaults = UserDefaults.standard
    private let monitoredKeys: [KeyType]
    private var observers: [NSKeyValueObservation]
    private var notify: (KeyType) -> Void

    public init(keys: [KeyType], notificationBlock: @escaping (KeyType) -> Void) {
        monitoredKeys = keys
        observers = []
        notify = notificationBlock
    }

    deinit {
        stop()
    }

    public func test<T>(keypath: KeyPath<T, String>) {
        print("in test, keypath is \(keyPath)")

    }
    
    public func start() {
        for keyPath in monitoredKeys {
            let observer = defaults.observe(keyPath) { (defaults, observedChange) in
                _ = defaults
                _ = observedChange
            }

            observers.append(observer)
        }

    }

    public func stop() {
        observers = []
    }

}
