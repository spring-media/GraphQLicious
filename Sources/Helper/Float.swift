//
//  Float.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

extension Float: Field {
  public var asGraphQLString: String {
    return description
  }
}

extension Float: ArgumentValue {
  public var asGraphQLArgument: String {
    return asGraphQLString
  }
}