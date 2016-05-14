//
//  Argument.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct Argument {
  public let key: String
  private var values: [ArgumentValue]
 
  public init(key: String, value: ArgumentValue) {
    self.init(key: key, values: [value])
  }
  
  public init(key: String, values: [ArgumentValue]) {
    self.key = key
    self.values = values
  }
}

extension Argument: GraphQLConvertible {
  public var asGraphQLString: String {
    guard key != "" else {
      return ""
    }
    switch values.count {
    case 0:
      return ""
    case 1:
      return "\(key): \(values[0].asGraphQLArgument)"
    default:
      let valuesString = self.values.map { value in
        value.asGraphQLArgument
        }.joinWithSeparator(",")
      return "\(key): [\(valuesString)]"
    }
  }
}