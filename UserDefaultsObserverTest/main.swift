//
//  main.swift
//  UserDefaultsObserverTest
//

import Foundation

enum MyKeysEnum: String {
    case foo
}

struct MyKeysStruct {
    let foo = "foo"
}

extension UserDefaults {
    struct MyKeysStruct {
        let foo = "foo"
    }
}

let defaults = UserDefaults.standard


let keyPath = \UserDefaults.MyKeysStruct.foo

// Change from terminal with:
//   defaults write com.test.UserDefaultsObserverTest foo -bool true
let observer = UserDefaultsObserver(keys: [keyPath]) { (key) in
    print("key \"\(key)\" changed")
}

observer.test(keypath: keyPath)

observer.start()

RunLoop.current.run()
