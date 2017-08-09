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
        let stringValue: String = bundle.info[.version]
        XCTAssertEqual(stringValue, "")
    }
    
    func test_subscript_whenStringKeyIsPresent_ItReturnsCorrectValue() {
        let stringValue: String = bundle.info[.name]
        XCTAssertEqual(stringValue, "App Name")
    }
    
    func test_whenIntKeyIsPresent_ItReturnsCorrectValue() {
        let intValue: Int = bundle.info[.build]
        XCTAssertEqual(intValue, 123)
    }
}
