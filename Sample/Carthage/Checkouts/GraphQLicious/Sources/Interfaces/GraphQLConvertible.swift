//
//  GraphQLConvertible.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/// A type with a customized textual representation suitable for GraphQL.
public protocol GraphQLConvertible {
  /// A GraphQL String representation of `self`.
  var asGraphQLString: String { get }
}