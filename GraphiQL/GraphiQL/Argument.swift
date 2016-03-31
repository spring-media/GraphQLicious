//
//  Argument.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct Argument {
  public let key: String
  private let values: [GraphQLStringConvertible]
  
  public init(key: String, value: GraphQLStringConvertible) {
    self.init(key: key, values: [value])
  }
  
  public init(key: String, values: [GraphQLStringConvertible]) {
    self.key = key
    self.values = values
  }
}

extension Argument: GraphQLStringConvertible {
  public var stringRepresentation: String {
    let valuesString = self.values.map { value in
      value.stringRepresentation
    }.joinWithSeparator(",")
    return "\(key): \(valuesString)"
  }
}