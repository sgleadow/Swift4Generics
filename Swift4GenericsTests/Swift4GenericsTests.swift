import XCTest
@testable import Swift4Generics

struct FakeBundle: BundleType {
    let infoDictionary: [String : Any]?
}

class Swift4GenericsTests: XCTestCase {
    var bundle: BundleType!
    var stringValue: String?
    var intValue: Int?
    
    override func setUp() {
        super.setUp()
        
        bundle = FakeBundle(infoDictionary: [
            "CFBundleName": "App Name",
            "CFBundleVersion": "123"
            ])
    }
    
    func test_subscript_whenKeyIsMissing_ItReturnsNil() {
        stringValue = bundle.info[.version]
        XCTAssertNil(stringValue)
    }
    
    func test_subscript_whenStringKeyIsPresent_ItReturnsCorrectValue() {
        stringValue = bundle.info[.name]
        XCTAssertEqual(stringValue, "App Name")
    }
    
    func test_generic_whenStringKeyIsPresent_ItReturnsCorrectValue() {
        stringValue = bundle.info.value(for: .name)
        XCTAssertEqual(stringValue, "App Name")
    }
    
    func test_whenIntKeyIsPresent_ItReturnsCorrectValue() {
        intValue = bundle.info[.build]
        XCTAssertEqual(intValue, 123)
    }
}
