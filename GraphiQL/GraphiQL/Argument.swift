//
//  Argument.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public protocol ArgumentValue: GraphQLStringConvertible {}

public struct Argument {
  public let key: String
  private let values: [ArgumentValue]
 
  public init(key: String, value: ArgumentValue) {
    self.init(key: key, values: [value])
  }
  
  public init(key: String, values: [ArgumentValue]) {
    self.key = key
    self.values = values
  }
}

extension Argument: GraphQLStringConvertible {
  public var graphQLString: String {
    guard key != "" else {
      return ""
    }
    switch values.count {
    case 0:
      return ""
    case 1:
      return "\(key): \(values[0].graphQLString)"
    default:
      let valuesString = self.values.map { value in
        value.graphQLString
        }.joinWithSeparator(",")
      return "\(key): [\(valuesString)]"
    }
  }
}

extension Int: ArgumentValue {}

extension Float: ArgumentValue {}

extension String: ArgumentValue {}
