//
//  MutatingField.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 27/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

public struct MutatingField {
  public let name: String
  public let value: ArgumentValue
  
  public init(name: String, value: ArgumentValue) {
    self.name = name
    self.value = value
  }
}

extension MutatingField: GraphQLConvertible {
  public var asGraphQLString: String {
    guard name != "" else {
      return ""
    }
    return "\(name): \(value.asGraphQLArgument)"
  }
}