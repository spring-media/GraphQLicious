//
//  ArgumentValue.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

///Argument value that can be read by GraphQL
public protocol ArgumentValue: GraphQLConvertible {
  /// A GraphQL Argument representation of `self`.
  var asGraphQLArgument: String { get }
}

extension ArgumentValue {
  public var asGraphQLString: String {
    return self.asGraphQLArgument
  }
}

extension String: ArgumentValue {
  public var asGraphQLArgument: String {
    return self.withQuotes
  }
}

extension Int: ArgumentValue {
  public var asGraphQLArgument: String {
    return asGraphQLString
  }
}

extension Float: ArgumentValue {
  public var asGraphQLArgument: String {
    return asGraphQLString
  }
}

extension Double: ArgumentValue {
  public var asGraphQLArgument: String {
    return asGraphQLString
  }
}

extension Bool: ArgumentValue {
  public var asGraphQLArgument: String {
    return asGraphQLString
  }
}
