// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: unittest_swift_deprecated_file.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Protos/unittest_swift_deprecated_file.proto - test proto
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
// -----------------------------------------------------------------------------
///
/// Test generation support of deprecated attributes.
///
// -----------------------------------------------------------------------------

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _3: SwiftProtobuf.ProtobufAPIVersion_3 {}
  typealias Version = _3
}

/// NOTE: The whole .proto file that defined this enum was marked as deprecated.
enum SwiftProtoTesting_DeprecatedFile_MyEnum: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case one // = 1
  case two // = 2
  case three // = 3

  init() {
    self = .one
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 1: self = .one
    case 2: self = .two
    case 3: self = .three
    default: return nil
    }
  }

  var rawValue: Int {
    switch self {
    case .one: return 1
    case .two: return 2
    case .three: return 3
    }
  }

}

/// Message comment
///
/// NOTE: The whole .proto file that defined this message was marked as deprecated.
struct SwiftProtoTesting_DeprecatedFile_MyMsg: SwiftProtobuf.ExtensibleMessage, Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var stringField: String {
    get {return _stringField ?? String()}
    set {_stringField = newValue}
  }
  /// Returns true if `stringField` has been explicitly set.
  var hasStringField: Bool {return self._stringField != nil}
  /// Clears the value of `stringField`. Subsequent reads from it will return its default value.
  mutating func clearStringField() {self._stringField = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
  fileprivate var _stringField: String? = nil
}

/// NOTE: The whole .proto file that defined this message was marked as deprecated.
struct SwiftProtoTesting_DeprecatedFile_MsgScope: Sendable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Extension support defined in unittest_swift_deprecated_file.proto.

// MARK: - Extension Properties

// Swift Extensions on the extended Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtoTesting_DeprecatedFile_MyMsg {

  /// Extension field comment
  ///
  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_stringExtField: String {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field) ?? String()}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_stringExtField: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_stringExtField() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field)
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_intExtField: Int32 {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field) ?? 0}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_intExtField: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_intExtField() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field)
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_fixedExtField: [UInt32] {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_fixed_ext_field) ?? []}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_fixed_ext_field, value: newValue)}
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_msgExtField: SwiftProtoTesting_DeprecatedFile_MyMsg {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field) ?? SwiftProtoTesting_DeprecatedFile_MyMsg()}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_msgExtField: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_msgExtField() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field)
  }

  /// Another extension field comment
  ///
  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_MsgScope_stringExt2Field: String {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field) ?? String()}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_MsgScope_stringExt2Field: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_MsgScope_stringExt2Field() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field)
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_MsgScope_intExt2Field: Int32 {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field) ?? 0}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_MsgScope_intExt2Field: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_MsgScope_intExt2Field() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field)
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_MsgScope_fixedExt2Field: [UInt32] {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.fixed_ext2_field) ?? []}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.fixed_ext2_field, value: newValue)}
  }

  /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
  var SwiftProtoTesting_DeprecatedFile_MsgScope_msgExt2Field: SwiftProtoTesting_DeprecatedFile_MyMsg {
    get {return getExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field) ?? SwiftProtoTesting_DeprecatedFile_MyMsg()}
    set {setExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field, value: newValue)}
  }
  /// Returns true if extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field`
  /// has been explicitly set.
  var hasSwiftProtoTesting_DeprecatedFile_MsgScope_msgExt2Field: Bool {
    return hasExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field)
  }
  /// Clears the value of extension `SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field`.
  /// Subsequent reads from it will return its default value.
  mutating func clearSwiftProtoTesting_DeprecatedFile_MsgScope_msgExt2Field() {
    clearExtensionValue(ext: SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field)
  }

}

// MARK: - File's ExtensionMap: SwiftProtoTesting_DeprecatedFile_UnittestSwiftDeprecatedFile_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
let SwiftProtoTesting_DeprecatedFile_UnittestSwiftDeprecatedFile_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field,
  SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field,
  SwiftProtoTesting_DeprecatedFile_Extensions_fixed_ext_field,
  SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field,
  SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.string_ext2_field,
  SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.int_ext2_field,
  SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.fixed_ext2_field,
  SwiftProtoTesting_DeprecatedFile_MsgScope.Extensions.msg_ext2_field
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// Extension field comment
///
/// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
let SwiftProtoTesting_DeprecatedFile_Extensions_string_ext_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
  _protobuf_fieldNumber: 101,
  fieldName: "swift_proto_testing.deprecated_file.string_ext_field"
)

/// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
let SwiftProtoTesting_DeprecatedFile_Extensions_int_ext_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufInt32>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
  _protobuf_fieldNumber: 102,
  fieldName: "swift_proto_testing.deprecated_file.int_ext_field"
)

/// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
let SwiftProtoTesting_DeprecatedFile_Extensions_fixed_ext_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.RepeatedExtensionField<SwiftProtobuf.ProtobufFixed32>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
  _protobuf_fieldNumber: 103,
  fieldName: "swift_proto_testing.deprecated_file.fixed_ext_field"
)

/// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
let SwiftProtoTesting_DeprecatedFile_Extensions_msg_ext_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<SwiftProtoTesting_DeprecatedFile_MyMsg>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
  _protobuf_fieldNumber: 104,
  fieldName: "swift_proto_testing.deprecated_file.msg_ext_field"
)

extension SwiftProtoTesting_DeprecatedFile_MsgScope {
  enum Extensions {
    /// Another extension field comment
    ///
    /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
    static let string_ext2_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
      _protobuf_fieldNumber: 201,
      fieldName: "swift_proto_testing.deprecated_file.MsgScope.string_ext2_field"
    )

    /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
    static let int_ext2_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufInt32>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
      _protobuf_fieldNumber: 202,
      fieldName: "swift_proto_testing.deprecated_file.MsgScope.int_ext2_field"
    )

    /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
    static let fixed_ext2_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.RepeatedExtensionField<SwiftProtobuf.ProtobufFixed32>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
      _protobuf_fieldNumber: 203,
      fieldName: "swift_proto_testing.deprecated_file.MsgScope.fixed_ext2_field"
    )

    /// NOTE: The whole .proto file that defined this extension field was marked as deprecated.
    static let msg_ext2_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<SwiftProtoTesting_DeprecatedFile_MyMsg>, SwiftProtoTesting_DeprecatedFile_MyMsg>(
      _protobuf_fieldNumber: 204,
      fieldName: "swift_proto_testing.deprecated_file.MsgScope.msg_ext2_field"
    )
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "swift_proto_testing.deprecated_file"

extension SwiftProtoTesting_DeprecatedFile_MyEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "MYENUM_ONE"),
    2: .same(proto: "MYENUM_TWO"),
    3: .same(proto: "MYENUM_THREE"),
  ]
}

extension SwiftProtoTesting_DeprecatedFile_MyMsg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MyMsg"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "string_field"),
  ]

  public var isInitialized: Bool {
    if !_protobuf_extensionFieldValues.isInitialized {return false}
    return true
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self._stringField) }()
      case 100..<536870912:
        try { try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: SwiftProtoTesting_DeprecatedFile_MyMsg.self, fieldNumber: fieldNumber) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._stringField {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    } }()
    try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 100, end: 536870912)
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SwiftProtoTesting_DeprecatedFile_MyMsg, rhs: SwiftProtoTesting_DeprecatedFile_MyMsg) -> Bool {
    if lhs._stringField != rhs._stringField {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
    return true
  }
}

extension SwiftProtoTesting_DeprecatedFile_MsgScope: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgScope"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    // Load everything into unknown fields
    while try decoder.nextFieldNumber() != nil {}
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SwiftProtoTesting_DeprecatedFile_MsgScope, rhs: SwiftProtoTesting_DeprecatedFile_MsgScope) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
