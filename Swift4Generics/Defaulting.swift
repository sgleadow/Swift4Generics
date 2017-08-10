import Foundation

protocol Defaulting {
    static var defaultValue: Self { get }
}

extension String: Defaulting {
    static var defaultValue: String {
        return ""
    }
}

extension Int: Defaulting {
    static var defaultValue: Int {
        return 0
    }
}
