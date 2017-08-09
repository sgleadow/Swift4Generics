import Foundation

struct InfoDictionary {
    enum Key: String {
        case name = "CFBundleName"
        case version = "CFBundleShortVersionString"
        case build = "CFBundleVersion"
    }
    
    let infoDictionary: [String : Any]?
    
    subscript(key: Key) -> Any? {
        return infoDictionary?[key.rawValue]
    }
}

protocol BundleType {
    var infoDictionary: [String : Any]? { get }
}

extension Bundle: BundleType {}

extension BundleType {
    var info: InfoDictionary {
        return InfoDictionary(infoDictionary: infoDictionary)
    }
}
