import Foundation

extension InfoDictionary {
    subscript(key: Key) -> Any? {
        return infoDictionary?[key.rawValue]
    }
}
