//
//  ExtendedField.swift
//  GraphiQL
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct ExtendedField: Field {
  public let name: String
  public let arguments: [Argument]
  
  
  public init(name: String, arguments: [Argument]) {
    self.name = name
    self.arguments = arguments.flatMap {$0}
  }
  
  public func createQuery() -> String {
    return self.graphQLString
  }
}

extension ExtendedField: GraphQLStringConvertible {
  public var graphQLString: String {
    return [name, getGraphQLString(forArguments: arguments)].joinWithSeparator("")
  }
  
  private func getGraphQLString(forArguments arguments: [Argument]) -> String {
    return "(\(arguments.graphQLString))"
  }
}

