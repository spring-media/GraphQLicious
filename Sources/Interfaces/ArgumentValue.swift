//
//  ArgumentValue.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/**
 Argument value that can be read by GraphQL
 */
public protocol ArgumentValue: GraphQLConvertible {
  var asGraphQLArgument: String { get }
}

extension ArgumentValue {
  public var asGraphQLString: String {
    return self.asGraphQLArgument
  }
}