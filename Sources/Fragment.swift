//
//  Fragment.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct Fragment {
  public let alias: String
  public let name: String
  public let fields: [Field]
  
  public init(withAlias alias: String, name: String, fields: [Field]) {
    self.alias = alias.withoutWhiteSpaces
    self.name = name.withoutWhiteSpaces
    self.fields = fields
  }
}

extension Fragment: Field {
  public var asGraphQLField: String {
    return "...\(alias)"
  }
  
  public var asGraphQLString: String {
    return [
      "fragment",
      alias,
      "on",
      name,
      getFieldsString()].joinWithSeparator(" ")
  }
  
  private func getFieldsString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\(fields.map{$0.asGraphQLField}.joinWithSeparator(","))}"
  }
}

extension Fragment: CustomDebugStringConvertible {
  public var debugDescription: String {
    return [
      "fragment",
      alias,
      "on",
      name,
      getFieldsDebugString()].joinWithSeparator(" ")
  }
  
  private func getFieldsDebugString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\n\t\(fields.map{$0.debugDescription}.joinWithSeparator(",\n\t"))\n}\n"
  }
}