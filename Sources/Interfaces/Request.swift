//
//  Request.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/// A Request with a customized textual representation suitable for GraphQL.
public protocol Request: Field, CustomDebugStringConvertible {
  /// The alias of `self`
  var alias: String { get }
  
  /// The name of `self`
  var name: String { get }
  
  /// The arguments of `self`
  var arguments: [GraphQLConvertible] { get }
  
  /// The fields of `self`
  var fields: [Field] { get }
}

/// Default Field implementation
extension Request {
  public var asGraphQLString: String {
    return [
      getAliasString(),
      name,
      getArgumentsString(),
      getFieldsString()
      ].joinWithSeparator("")
  }
  
  private func getAliasString() -> String {
    return alias == "" ? "" : "\(alias):"
  }
  
  private func getArgumentsString() -> String {
    guard arguments.count > 0 else {
      return ""
    }
    return "(\(arguments.map {$0.asGraphQLString}.joinWithSeparator(",")))"
  }
  
  private func getFieldsString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\(fields.map {$0.asGraphQLField}.joinWithSeparator(","))}"
  }
}

/// Default CustomDebugStringConvertible implementation
extension Request {
  public var debugDescription: String {
    return [
      getAliasString(),
      name,
      getArgumentsString(),
      getFieldsDebugString()
      ].joinWithSeparator(" ")
  }
  
  private func getFieldsDebugString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\n\t\t\(fields.map{$0.asGraphQLField}.joinWithSeparator(",\n\t\t"))\n\t}"
  }
}