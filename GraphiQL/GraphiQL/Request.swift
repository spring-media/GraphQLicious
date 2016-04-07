//
//  Request.swift
//  GraphiQL
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct Request: Field {
  public let alias: String
  public let name: String
  public let arguments: [Argument]
  public let fields: [Field]
  
  public init(withAlias alias: String = "", name: String, arguments: [Argument] = [], fields: [Field] = []) {
    self.alias = alias.withoutWhiteSpaces
    self.name = name.withoutWhiteSpaces
    self.arguments = arguments.flatMap {$0}
    self.fields = fields.flatMap {$0}
  }
}

extension Request: GraphQLStringConvertible {
  public var graphQLString: String {
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
    return "(\(arguments.graphQLString))"
  }
  
  private func getFieldsString() -> String {
    guard fields.count > 0 else {
      return ""
    }
    // TODO: Check for fix in Xcode 7.3
    return "{\(fields.map{$0.graphQLString}.joinWithSeparator(","))}"
  }
}
