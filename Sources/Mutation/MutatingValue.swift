//
//  MutatingValue.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 27/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

public struct MutatingValue: ArgumentValue {
  public var fields: [MutatingField]
  
  public init(withFields fields: [MutatingField]) {
    self.fields = fields
  }
  
  public var asGraphQLArgument: String {
    return "{\(fields.asGraphQLString)}"
  }
}