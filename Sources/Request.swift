//
//  Request.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

public struct Request {
  public let alias: String
  public let name: String
  public let arguments: [Argument]
  public let fields: [Field]
  
  public init(withAlias alias: String = "", name: String, arguments: [Argument] = [], fields: [Field] = []) {
    self.alias = alias.withoutWhiteSpaces
    self.name = name.withoutWhiteSpaces
    self.arguments = arguments
    self.fields = fields
  }
}

extension Request: Field {
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
    return "(\(arguments.asGraphQLString))"
  }
  
  private func getFieldsString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\(fields.map{$0.asGraphQLField}.joinWithSeparator(","))}"
  }
}

extension Request: CustomDebugStringConvertible {
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