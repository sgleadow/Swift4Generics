import Foundation

protocol InfoDictionaryConvertible {
    static func convert(_ value: String) -> Self?
}

extension String: InfoDictionaryConvertible {
    static func convert(_ value: String) -> String? {
        return value
    }
}

extension Int: InfoDictionaryConvertible {
    static func convert(_ value: String) -> Int? {
        return Int(value)
    }
}

extension InfoDictionary {
    subscript<T: InfoDictionaryConvertible>(key: Key) -> T? {
        let stringValue = infoDictionary?[key.rawValue] as? String
        return stringValue.flatMap(T.convert)
    }
}
