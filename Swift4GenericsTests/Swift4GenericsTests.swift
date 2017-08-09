import XCTest
@testable import Swift4Generics

struct FakeBundle: BundleType {
    let infoDictionary: [String : Any]?
}

class Swift4GenericsTests: XCTestCase {
    var bundle: BundleType!
    
    override func setUp() {
        super.setUp()
        
        bundle = FakeBundle(infoDictionary: [
            "CFBundleName": "App Name",
            "CFBundleVersion": "123"
            ])
    }
    
    func test_subscript_whenKeyIsMissing_ItReturnsNil() {
        let value = bundle.info[.version]
        XCTAssertNil(value)
    }
    
    func test_subscript_whenStringKeyIsPresent_ItReturnsCorrectValue() {
        let value = bundle.info[.name] as? String
        XCTAssertEqual(value, "App Name")
    }
    
    func test_generic_whenStringKeyIsPresent_ItReturnsCorrectValue() {
        let value: String? = bundle.info.value(for: .name)
        XCTAssertEqual(value, "App Name")
    }
    
//    func test_whenIntKeyIsPresent_ItReturnsCorrectValue() {
//        let value = bundle.info[.version] as? Int
//        XCTAssertEqual(value, 123)
//    }
}
