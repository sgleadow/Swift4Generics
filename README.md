# Swift 4 Generics Demo

This is some sample code I used in a live coding demo of some properties of generics in Swift 4.

Most of these features were already available in Swift 3, so it just touched on a couple of items, like:

* adding generics to a `subscript` methpod (new in Swift 4)
* conforming to multiple protocols (already existed before Swift 4)

## Video

[Jesse](https://twitter.com/sirjec) does a great job of recording the presentations each month at [Melbourne Cocoaheads](https://melbourneococoaheads.com), including [this partocular talk about extracting strongly typed values](https://www.youtube.com/watch?v=n3r3k6Kqkfc&index=12&list=UUpTDVzUkk9ieAyVyUi28bWw).

## Requirements

The early parts of the demo use Xcode 8, but the later parts that require Swift 4, you'll need to be running Xcode 9.

## Topics

**Generics on subscripts**

In Xcode 8:

```swift
extension InfoDictionary {
    // This couldn't have a generic type constraint
    subscript(key: Key) -> Any? {
        let value = infoDictionary?[key.rawValue]
        return value
    }
}

// So you had to cast on the way out
let value: String? = bundle.info[.name] as? String
```

In Xcode 9:

```swift
extension InfoDictionary {
    // Can define a generic type constraint here
    subscript<T: Convertible & Defaulting>(key: Key) -> T {
        let value = infoDictionary?[key.rawValue] as? String
        return value.flatMap(T.convert) ?? T.defaultValue
    }
}

// So you don't need to cast on the way out
let value: String? = bundle.info[.name]
```

**Extracting defined values**

The demo uses a little wrapper around `Bundle` to extract values based on pre-defined kets.

```swift
struct InfoDictionary {
    enum Key: String {
        case name = "CFBundleName"
        case version = "CFBundleShortVersionString"
        case build = "CFBundleVersion"
    }

    let infoDictionary: [String : Any]?
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
```

**Extra useful protocols**

The demo defines a couple of extra protocols used to convert values to the correct type, and to define default values if anything is missing or fails.

I've defined implementations of these for both `String` and `Int`.

```swift
protocol Convertible {
    static func convert(_ value: String) -> Self?
}

protocol Defaulting {
    static var defaultValue: Self { get }
}
```
