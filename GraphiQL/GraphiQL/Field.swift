//
//  Field.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/**
 Field that can be read by GraphQL
 */
public protocol Field: GraphQLConvertible {
  var asGraphQLField: String { get }
}

extension Field {
  public var asGraphQLField: String {
    return asGraphQLString
  }
}