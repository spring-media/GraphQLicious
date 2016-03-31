//
//  Request.swift
//  GraphiQL
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct Request {
  
  public let name: String
  public let arguments: [Argument]
  public let fields: [Field]
  
  public init(name: String, arguments: [Argument], fields: [Field]) {
    self.name = name
    self.arguments = arguments
    self.fields = fields
  }
  
  public func createQuery() -> String {
    return "{\(self.stringRepresentation)}"
  }
}

extension Request: GraphQLStringConvertible {
  public var stringRepresentation: String {
    return [
      name,
      getDescription(forArguments: arguments),
      getDescription(forFields: fields)
    ].joinWithSeparator("")
  }
  
  private func getDescription(forArguments arguments: [Argument]) -> String {
    guard arguments.count > 0 else {
      return ""
    }
    return "(\(arguments.stringRepresentation))"
  }
  
  private func getDescription(forFields fields: [Field]) -> String {
    guard fields.count > 0 else {
      return ""
    }
    return "{\(fields.stringRepresentation)}"
  }
}
