# API Overview

---

> :warning: **WARNING** :warning: This project is in a _prerelease_ state. There
> is active work going on that will result in API changes that can/will break
> code while things are finished. Use with caution.

---

This is a description of how you can use the code generated by the plugin.

Apart from the actual properties themselves, most of this is not explicit in the generated code.  Rather, most of this appears in common shared protocols in the runtime library.  They're collected here to present a single document for how you can use the generated code.

## Message API

Messages in the input proto file generate Swift structs in the result.  These structs conform to `ProtobufMessage` and provide Swift properties for every field, basic information about the message, standard initializers, and serialization and deserialization methods.

Here is a simple proto3 input file to motivate the example below:

```protobuf
syntax = "proto3";
message Example {
   enum E {
      DEFAULT = 0;
   }
   int32 field1 = 1;
   repeated string field2 = 2;
}
```

Here is the API for the struct generated from the above.  Note that this includes a lot of methods that come from various protocols and omits some parts of the generated code that are intended purely for internal use by the library:

```swift
public struct Example: ProtobufMessage {
  // The generated struct carries constant properties reflecting
  // basic information about the message:
  public var swiftClassName: String {return "Example"}
  public var protoMessageName: String {return "Example"}
  public var protoPackageName: String {return ""}
  public var jsonFieldNames: [String: Int] {return ["field": 1]}
  public var protoFieldNames: [String: Int] {return ["field": 1]}

  // Nested enum and message types are nested in the generated Swift
  public enum E: ProtobufEnum { ... }

  // A public property is created for each field in the proto.
  public var field1: Int32 { get set }
  public var field2: [String] { get set }

  // Default Initializer
  public init()

  // A convenience initializer is constructed that has an
  // argument for every field.  This simplifies constructing
  // complex constant objects.
  public init(field1: Int32? = nil, field2: [String] = [])

  // Messages can be serialized or deserialized to Data objects
  // using protobuf binary format.
  // The extension set methods are only for proto2 extensible messages;
  // see below for more details.
  func serializeProtobuf() throws -> Data
  init(protobuf: Data) throws {
  init(protobuf: Data, extensions: ProtobufExtensionSet? = nil) throws

  // Messages can be serialized or deserialized to String objects
  // using JSON format.
  // See below for discussion of extension sets.
  func serializeJSON() throws -> String
  init(json: String) throws
  init(json: String, extensions: ProtobufExtensionSet) throws

  public var debugDescription: String
  public var hashValue: Int

  // The == operator below is implemented in terms of this method
  // so that you can easily override the implementation.
  // You should not call this method directly.
  public var isEqual(other: Example) -> Bool

  // These are the core methods used by all serialization and
  // deserialization mechanisms.
  public func decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool
  public func traverse(visitor: inout ProtobufVisitor) throws
}

func ==(lhs: Example, rhs: Example) -> Bool
```

### Overridable Message methods

The following methods can be defined in manually-constructed extensions if you want to override the generated behavior for any reason:

```swift
   // These are standard properties.
   public var debugDescription: String
   public var hashValue: Int

   // These are heavily used by the protobuf libraries but are rarely
   // used directly in normal code.
   public func isEqualTo(other: Example) -> Bool
   public mutating func decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool
   public func traverse(visitor: inout ProtobufVisitor) throws
```

To allow the above to be easily overridden, they are all defined
in the `ProtobufGeneratedMessage` protocol.  The generated code
provides standard implementations of the core capabilities under
different names; you can use these when overriding the above
methods, but we strongly advise you not to call these directly
from your own code except in such overrides:

```swift
public extension Example: ProtobufGeneratedMessage {
  public mutating fund _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool
  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws
  public var _protoc_generated_isEqualTo(other: Example) -> Bool
}
```

## Enum API

Proto enums are translated to Swift enums in a fairly straightforward manner.  The resulting Swift enums conform to the `ProtobufEnum` protocol which extends `RawRepresentable` with a `RawValue` of `Int`.

Proto2 enums simply have a case for each enum value.  If deserialization encounters an unknown value, that value is either ignored (JSON) or handled as an unknown field (protobuf binary), depending on the particular serialization.

Proto3 enums have an additional `UNRECOGNIZED(Int)` case that is used whenever an unrecognized value is parsed from protobuf serialization or from other serializations that store integer enum values.  JSON serialization with named enum values drops unrecognize names.

```swift
public enum MyEnum: ProtobufEnum {
    public typealias RawValue = Int

    // Case for each value
    // Names are translated to a lowerCamelCase convention from
    // the UPPER_CASE convention in the proto file:
    case default
    case other
    case andMore
    case UNRECOGNIZED(Int) // Only in proto3 enums

    // Initializer selects the default value (see proto2 and proto3
    // language guides for details.
    public init()

    public init?(rawValue: Int)
    public init?(name: String)
    // Select the enum case based on JSON serialized name.
    // (See proto3 JSON serialization specification for details)
    public init?(jsonName: String)
    // Select the enum case matching the provide name, as
    // specified in the proto file.
    public init?(protoName: String)
    public var rawValue: Int
    // Return the full JSON coding for the current value.
    // This is normally a quoted string, but
    // UNRECOGNIZED(Int) returns a JSON number.
    public var json: String
    public var hashValue: Int
    public var debugDescription: String
}
```

## Mapping proto field types to Swift types

Types in the proto file are mapped to Swift types as follows:

### Basic types

| Proto type                |  Swift Type        |
| ------------------------- | ------------------ |
| int32                     | Int32              |
| sint32                    | Int32              |
| sfixed32                  | Int32              |
| uint32                    | UInt32             |
| fixed32                   | UInt32             |
| int64                     | Int64              |
| sint64                    | Int64              |
| sfixed64                  | Int64              |
| uint64                    | UInt64             |
| fixed64                   | UInt64             |
| bool                      | Bool               |
| float                     | Float              |
| double                    | Double             |
| string                    | String             |
| bytes                     | Data               |

### Generated Types

Enums in the proto file generate Int-valued enums in the Swift code.

Groups in the proto file generate Swift structs that conform to ProtobufGroup.

Messages in the proto file generate Swift structs that conform to ProtobufMessage.

Note:  There are also `ProtobufGeneratedGroup` and `ProtobufGeneratedMessage` protocols.  You should not refer to these directly; use `ProtobufGroup` and `ProtobufMessage` when you need to work with arbitrary groups or messages.

### Type modifiers

**Proto3 singular fields** generate properties of the corresponding type above.  These properties are initialized to the appropriate default value as specified in the proto3 documentation:

* Numeric fields are initialized to zero.
* Boolean fields are initialize to false.
* String fields are initialized to the empty string.
* Bytes fields are initialized to an empty Data() object.
* Enum fields are initialized to the default value (the value corresponding to zero, which must be the first item in the enum).
* Message fields are initialized to an empty message of the appropriate type.

Notes: For performance, the field may be initialized lazily, but this is invisible to the user.  The property will be serialized if it has a non-default value.

**Proto2 `optional` fields without default values** generate properties whose type is `Optional<T>` for the corresponding T as listed above.  The initial value is nil.  You can set the value to nil to erase it.

**Proto2 `optional` fields with default values** work the same way but when read, `nil` values are converted to the default value.  In particular, setting the value to nil restores the default.  Optional fields are serialized unless the internal value is nil, so setting an optional field explicitly to the default value will cause it to be serialized.

**Proto2 `required` fields** TODO

### Compound types

**Proto `repeated` fields** generate simple properties of type `Array<T>` where T is the base type from above.  Repeated fields are always initialized to empty.

**Proto `map` fields** generate simple properties of type `Dictionary<T,U>` where T and U are the respective key and value types from above.  Map fields are always initialized to an empty map.

### Oneof fields

Oneof fields generate an enum with a case for each associated field plus a separate `None` case.  These enums conform to `ProtobufOneofEnum`.  Every case except for the `None` case has an associated value corresponding to the declared field.

In addition to the enum itself, the message will contain a read/write property named after the enum which contains the enum value and a separate read/write computed property for each member field of the enum.

### Groups

Groups act exactly like messages in all respects, except that they cannot be directly serialized on their own and they conform to the `ProtobufGroup` protocol instead of `ProtobufMessage`.

## Well-Known Types

For most of the proto3 well-known types, the Swift API is exactly what you would expect from the corresponding proto definitions.  (In fact, the runtime library version for most of these is simply generated.)  The variations are described below.

| Proto Type                  |  Swift Type               |
| -------------------------   | -----------------------   |
| google.protobuf.Any         | Google_Protobuf_Any         |
| google.protobuf.Api         | Google_Protobuf_Api         |
| google.protobuf.BoolValue   | Google_Protobuf_BoolValue   |
| google.protobuf.BytesValue  | Google_Protobuf_BytesValue  |
| google.protobuf.DoubleValue | Google_Protobuf_DoubleValue |
| google.protobuf.Duration    | Google_Protobuf_Duration    |
| google.protobuf.Empty       | Google_Protobuf_Empty       |
| google.protobuf.FieldMask   | Google_Protobuf_FieldMask   |
| google.protobuf.FloatValue  | Google_Protobuf_FloatValue  |
| google.protobuf.Int64Value  | Google_Protobuf_Int64Value  |
| google.protobuf.ListValue   | Google_Protobuf_ListValue   |
| google.protobuf.StringValue | Google_Protobuf_StringValue |
| google.protobuf.Struct      | Google_Protobuf_Struct      |
| google.protobuf.Timestamp   | Google_Protobuf_Timestamp   |
| google.protobuf.Type        | Google_Protobuf_Type        |
| google.protobuf.UInt32Value | Google_Protobuf_UInt32Value |
| google.protobuf.UInt64Value | Google_Protobuf_UInt64Value |
| google.protobuf.Value       | Google_Protobuf_Value       |


### Google_Protobuf_Any

The Any JSON representation is treated essentially as a separate serialization format.  Each message has
```
  TODO
```

### Google_Protobuf_BoolValue, Google_Protobuf_BytesValue, etc.

These are customized to produce the expected JSON and Any JSON forms, but are otherwise exactly as you would expect.

### Google_Protobuf_Duration, Google_Protobuf_Timestamp

The `Google_Protobuf_Duration` and `Google_Protobuf_Timestamp` structs have customized JSON and Any JSON handling to match Google's specification.  In particular, JSON serialization will throw an error if the duration is greater than 315576000000 seconds or if the timestamp is before `0001-01-01T00:00:00Z` or after `9999-12-31T23:59:59.999999999Z` Gregorian proleptic.

The `Google_Protobuf_Duration` type also conforms to `ExpressibleByFloatLiteral`; it can be initialized with a double representing the number of seconds.

There are also overrides for simple arithmetic with durations and timestamps:

```swift
func -(lhs: Google_Protobuf_Timestamp, rhs: Google_Protobuf_Timestamp) -> Google_Protobuf_Duration
func -(lhs: Google_Protobuf_Duration, rhs: Google_Protobuf_Duration) -> Google_Protobuf_Duration
public func +(lhs: Google_Protobuf_Duration, rhs: Google_Protobuf_Duration) -> Google_Protobuf_Duration
public func -(operand: Google_Protobuf_Duration) -> Google_Protobuf_Duration
public func -(lhs: Google_Protobuf_Timestamp, rhs: Google_Protobuf_Duration) -> Google_Protobuf_Timestamp
public func +(lhs: Google_Protobuf_Timestamp, rhs: Google_Protobuf_Duration) -> Google_Protobuf_Timestamp
```

### Google_Protobuf_Value, Google_Protobuf_Struct, Google_Protobuf_ArrayValue

`Google_Protobuf_NullValue` is a simple single-value enum.

As expected, `Google_Protobuf_Struct` contains a single `fields` dictionary mapping strings to `Google_Protobuf_Value` objects.  It also conforms to `ExpressibleByDictionaryLiteral` and provides a `subscript` for directly accessing the values by name.

The `Google_Protobuf_Value` type implements the expected oneof semantics, with a separate property for each type of contained object.

## Extensions

Extensions are used to add additional properties to messages defined elsewhere.  They are fully supported in proto2 files.  They are supported in proto3 only when extending the standard Descriptor type.  These are defined in proto files as follows:

```protobuf
/// File sample.proto
syntax="proto2";
message CanBeExtended {
   extensions 100 to 200;
}

extend CanBeExtended {
   optional int32 extensionField = 100;
}
```

There are several pieces to the extension support:

 * **Extensible Messages** (such as `CanBeExtended` above) conform to `ProtobufExtensibleMessage` and define some additional methods needed by the other components.  You should not use these methods directly.
 * **Extension properties** use Swift `extension` to add new properties to the original message.  In many cases, you can simply use the extension properties without understanding any of the other extension machinery.  The above example creates a Swift extension of `CanBeExtended` that defines a new property `extensionField` of type `Optional<Int32>`.
 * **Extension objects** are opaque objects that define the extension itself, including storage and serialization details.  Because proto allows extension names to be reused, these objects appear in the context corresponding to the context where the proto extension was defined, which generally does not correspond to that of the message being extended.  In the above example, the extension object would be `CanBeExtended_extensionField` at the file scope.
 * **Extension sets** are collections of extension objects.  An extension set is generated by the code generator and included as a static global variable in every Swift source file generated from a proto file that defines extensions.  Extension sets are provided to the deserialization APIs to define what extension fields the decoder should recognize.  In the above example, the generated extension set would be `Sample_Extensions`.

```swift
/// ProtobufExtensionSet implements a subset of the Set API.
public struct ProtobufExtensionSet: ExpressibleByArrayLiteral {
    public typealias Element = ProtobufMessageExtension
    public init()
    init(arrayLiteral: Element...)
    public subscript(messageType: ProtobufMessage.Type, protoFieldNumber: Int) -> ProtobufMessageExtension?
    public func fieldNumberForJson(messageType: ProtobufJSONMessageBase.Type, jsonFieldName: String) -> Int?
    public mutating func insert(_: Element)
    public mutating func insert(contentsOf: [Element])
    public mutating func union(_: ProtobufExtensionSet) -> ProtobufExtensionSet
}
```

# Generated Code Reference

The following describes how each construct in a `.proto` file gets translated into Swift language constructs:

**Files:** Each input `.proto` file generates a single output file with the `.proto` extension replaced with `.pb.swift`.

**Messages:** Each input message generates a single output struct that conforms to the `ProtobufMessageType` protocol.  Small leaf messages (those that don't have message-typed fields) generate simple structs.  Non-leaf messages use a private copy-on-write backing class to provide full value semantics while also supporting recursive data structures.  Nested messages generate nested struct types so that
```protobuf
package quux;
message Foo {
   message Bar {
      int32 baz = 1;
   }
   Bar bar = 1;
}
```
will be compiled to a structure like the following
```swift
public struct QuuxFoo {
    // ...
    public struct Bar {
        // ...
        var baz: Int32 {get set}
        // ...
    }
    var bar: Bar {get set}
    // ...
}
```
which you can use as follows:
```swift
   var foo = QuuxFoo()
   foo.bar.baz = 77
```

**Groups:** Each group within a message generates a nested struct.  The group struct implements the `ProtobufGroupType` protocol which differs from `ProtobufMessageType` primarily in how it handles serialization and deserialization (you do not normally need to be aware of this).  Note that groups are deprecated and only available with the older 'proto2' language dialect.

**Binary Serialization and Deserialization:**  You can serialize to a `Data` using the `serializeProtobuf()` method or deserialize with the corresponding initializer:
```swift
init(protobuf: Data) throws
func serializeProtobuf() throws -> Data
```
Protobuf binary serialization can currently only fail if the data includes Any fields that were decoded from JSON format.  See below for details.

Unrecognized fields are preserved through decoding/encoding cycles for proto2 messages.  Unrecognized fields are dropped for proto3 messages.

**JSON Serialization and Deserialization:**  Similarly, JSON serialization is handled by `serializeJSON()` which returns a `String` with the result.  Deserialization is handled by the corresponding initializer:
```swift
init(json: String) throws
func serializeJSON() throws -> String
```
JSON serialization can fail if there are Any fields that were decoded from binary protobuf format, or if you abuse the well-known Timestamp, Duration, or FieldMask types.

**Other Message Features:** All messages conform to `Hashable`, `Equatable`, and `CustomDebugStringConvertible`.

**Convenience Initializer:** Messages that have fields gain an additional convenience intializer that has an argument for every field.  The arguments are defaulted so you can specify only the ones you actually need to set.

**Fields:**  Each field is compiled into a property on the struct.  Field names are converted from `snake_case` conventions in the proto file to `lowerCamelCase` property names in the Swift file.  If the result conflicts with a reserved word, an underscore will be appended to the property name.

**Optional Fields:**  Optional fields generate Swift Optional properties. Such properties have a default value of `nil` unless overridden in the .proto file. You can assign `nil` to any such property to reset it to the default.  For optional fields without a default, you can test whether the field is `nil` to see if it has been set.  There is currently no way to test if optional fields that do have defaults have been set.

When serializing an optional field, the field is serialized if it has been set to a non-nil value.  In particular, fields with defaults are not serialized if they have been reset by writing 'nil' but are serialized if you explicitly set them to the default value.

**Required Fields:**  Required fields generate non-Optional properties.  All such properties return suitable default values when read.  If no default value is specified in the .proto, numeric fields default to zero, boolean fields default to false, string fields default to the empty string, byte fields default to the empty array, enum fields default to the appropriate default enum value, and message fields default to an empty object of that type.  Currently, required fields are always serialized, even if they have not been changed from their default.  This may change.

**Repeated Fields:** Repeated fields generate array-valued properties. All such properties default to an empty array.

**Map:** Map fields generate Dictionary-valued properties. When read, these properties default to an empty dictionary.  The dictionary values can be mutated directly.

**Proto3 Singular Fields:**  Proto3 does not support required or optional fields.  Singular proto3 fields generate non-optional Swift properties.  These fields are initialized to the appropriate Proto3 default value (zero for numeric fields, false for booleans, etc.)  They are serialized if they have a non-default value.

**Proto3 Singular message Fields:**  Proto3 singular message fields behave externally as other singular fields.  In particular, reading such a field returns a valid empty message object by default.  Internally, however, singular message fields are in fact stored as Swift optionals, but this is only done as an optimization and is not visible to clients.

**Enums:** Each enum in the proto file generates a Swift enum that implements RawRepresentable with a base type of Int. The enum is nested within an enclosing message, if any. The enum contains the specified cases from the source .proto plus an extra `UNRECOGNIZED(Int)` case that is used to carry unknown enum values when decoding binary protobuf format.  Enums with duplicate cases (more than one case with the same integer value) are fully supported.

**Oneof:** Each oneof field generates an enum with a case for each field in the oneof block. The containing message provides an accessor for the oneof field itself that allows you to set or get the enum value directly and allows you to use a `switch` or `if case` statement to conditionally handle the contents. The containing message also provides shortcut accessors for each field in the oneof that will return the corresponding value if present or `nil` if that value is not present.

**Reflection:**  The standard Swift Mirror() facility can be used to inspect the fields on generated messages.  Fields appear in the reflection if they would be serialized.  In particular, proto2 required fields are always included, proto2 optional fields are included if they are non-nil, and proto3 singular fields are included if they do not have a default value.

**Extensions:**  Each extension in a proto file generates two distinct components:

* An extension object that defines the type, field number, and other properties of the extension.  This is defined at a scope corresponding to where the proto extension was defined.

* A Swift extension of the message struct that provides natural property access for the extension value on that message struct.

Each generated Swift file that defines extensions also has a static constant holding a ProtobufExtensionSet with all extensions declared in that file.

To decode a message with extensions, you need to first obtain or construct a ProtobufExtensionSet holding extension objects for all of the extensions you want to support.  A single ProtobufExtensionSet can hold any number of extensions for any number of messages.  You then provide this set to the deserializing initializer which will use it to identify and deserialize extension fields.

You need do nothing special to have extension values properly serialized.

To set or read extension properties, you simply use the standard property access.

Caveat:  Extensions are not available in proto3.

**Any:**  The Any message type is included in the runtime package as `Google_Protobuf_Any`.  You can construct a message from a `Google_Protobuf_Any` value via a convenience initializer available on any ProtobufMessageType: `init?(any: Google_Protobuf_Any)`.  You can similarly construct a `Google_Protobuf_Any` object from any message using `Google_Protobuf_Any(message: ProtobufMessageType)`.  To support this, each generated message includes a property `anyTypeURL` containing the URL for that message type.  This URL is included in the Any object when one is constructed from a message, and is checked when constructing a message from an Any.  Caveat:  Although Any fields can be encoded in both binary protobuf and JSON, Google's spec places limits on translations between these two codings.  As a result, you should be careful with Any fields if you expect to use both JSON and protobuf encodings.

**Well-known types:**  Google has defined a number of "well-known types" as part of proto3.  These are predefined messages that support common idioms.  These well-known types are precompiled and bundled into the Swift runtime:

| Proto Type                  |  Swift Type               |
| -------------------------   | -----------------------   |
| google.protobuf.Any         | Google_Protobuf_Any         |
| google.protobuf.Api         | Google_Protobuf_Api         |
| google.protobuf.BoolValue   | Google_Protobuf_BoolValue   |
| google.protobuf.BytesValue  | Google_Protobuf_BytesValue  |
| google.protobuf.DoubleValue | Google_Protobuf_DoubleValue |
| google.protobuf.Duration    | Google_Protobuf_Duration    |
| google.protobuf.Empty       | Google_Protobuf_Empty       |
| google.protobuf.FieldMask   | Google_Protobuf_FieldMask   |
| google.protobuf.FloatValue  | Google_Protobuf_FloatValue  |
| google.protobuf.Int64Value  | Google_Protobuf_Int64Value  |
| google.protobuf.ListValue   | Google_Protobuf_ListValue   |
| google.protobuf.StringValue | Google_Protobuf_StringValue |
| google.protobuf.Struct      | Google_Protobuf_Struct      |
| google.protobuf.Timestamp   | Google_Protobuf_Timestamp   |
| google.protobuf.Type        | Google_Protobuf_Type        |
| google.protobuf.UInt32Value | Google_Protobuf_UInt32Value |
| google.protobuf.UInt64Value | Google_Protobuf_UInt64Value |
| google.protobuf.Value       | Google_Protobuf_Value       |


To use the well-known types in your own protos, you will need to have the corresponding protos available so you can `import` them into your proto file.  However, the compiled forms of these types are already available in the library; you do not need to compile them or do anything to use them other than `import Protobuf`.

## Aside:  proto2 vs. proto3

The terms *proto2* and *proto3* refer to two different dialects of the proto *language.*  The older proto2 language dates back to 2008, the proto3 language was introduced in 2015.  These should not be confused with versions of the protobuf *project* or the protoc *program*.  In particular, the protoc 3.0 program has solid support for both proto2 and proto3 language dialects.  Many people continue to use the proto2 language with protoc 3.0 because they have existing systems that depend on particular features of the proto2 language that were changed in proto3.
