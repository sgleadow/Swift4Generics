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
    
    // Initial
    
    func test_subscript_whenKeyIsMissing_ItReturnsNil() {
        let value: String? = bundle.info[.version] as? String
        XCTAssertEqual(value, nil)
    }
    
    func test_subscript_whenStringValueIsPresent_ItReturnsCorrectValue() {
        let value: String? = bundle.info[.name] as? String
        XCTAssertEqual(value, "App Name")
    }
    
//    func test_subscript_whenIntValueIsPresent_ItReturnsCorrectValue() {
//        let value: Int? = bundle.info[.name] as? Int
//        XCTAssertEqual(value, 123)
//    }
    
    
    
    
    
    
    
    
    
    // Converted
    
//    func test_subscript_whenKeyIsMissing_ItReturnsNil() {
//        let value: String? = bundle.info[.version]
//        XCTAssertEqual(value, nil)
//    }
//
//    func test_subscript_whenStringValueIsPresent_ItReturnsCorrectValue() {
//        let value: String? = bundle.info[.name]
//        XCTAssertEqual(value, "App Name")
//    }
//
//    func test_subscript_whenIntValueIsPresent_ItReturnsCorrectValue() {
//        let value: Int? = bundle.info[.build]
//        XCTAssertEqual(value, 123)
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Converted + Default
    
//    func test_subscript_whenStringValueIsPresent_ItReturnsCorrectValue() {
//        let value: String = bundle.info[.name]
//        XCTAssertEqual(value, "App Name")
//    }
//
//    func test_subscript_whenIntValueIsPresent_ItReturnsCorrectValue() {
//        let value: Int = bundle.info[.build]
//        XCTAssertEqual(value, 123)
//    }
}
