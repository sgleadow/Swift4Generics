import Foundation

protocol Convertible {
    static func convert(_ value: String) -> Self?
}

extension String: Convertible {
    static func convert(_ value: String) -> String? {
        return value
    }
}

extension Int: Convertible {
    static func convert(_ value: String) -> Int? {
        return Int(value)
    }
}
