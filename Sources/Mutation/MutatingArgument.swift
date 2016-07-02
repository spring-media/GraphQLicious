//
//  MutatingArgument.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 27/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

public struct MutatingArgument {
  public let key: String
  public let mutatingValue: ArgumentValue
  
  public init(key: String, mutatingValue: ArgumentValue) {
    self.key = key
    self.mutatingValue = mutatingValue
  }
}

extension MutatingArgument: GraphQLConvertible {
  public var asGraphQLString: String {
    guard key != "" else {
      return ""
    }
    return "\(key): \(mutatingValue.asGraphQLArgument)"
  }
}