import Foundation

extension InfoDictionary {
    subscript(key: Key) -> Any? {
        let value = infoDictionary?[key.rawValue]
        return value
    }
}

