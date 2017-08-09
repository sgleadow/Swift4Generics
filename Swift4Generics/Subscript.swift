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

protocol InfoDictionaryDefaultable {
    static var defaultValue: Self { get }
}

extension String: InfoDictionaryDefaultable {
    static var defaultValue: String {
        return ""
    }
}

extension Int: InfoDictionaryDefaultable {
    static var defaultValue: Int {
        return 0
    }
}

extension InfoDictionary {
    subscript<T: InfoDictionaryConvertible & InfoDictionaryDefaultable>(key: Key) -> T {
        let stringValue = infoDictionary?[key.rawValue] as? String
        return stringValue.flatMap(T.convert) ?? T.defaultValue
    }
}
