import Foundation

extension InfoDictionary {
    subscript<T>(key: Key) -> T? {
        return infoDictionary?[key.rawValue] as? T
    }
}
