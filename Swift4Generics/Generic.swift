import Foundation

extension InfoDictionary {
    func value<T>(for key: Key) -> T? {
        return infoDictionary?[key.rawValue] as? T
    }
}
