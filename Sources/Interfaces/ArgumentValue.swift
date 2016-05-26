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

public typealias MutatingField = Argument

public struct Value: ArgumentValue {
  public var fields: [MutatingField]
  
  public init(withFields fields: [MutatingField]) {
    self.fields = fields
  }
  
  public var asGraphQLArgument: String {
    return "{\(fields.asGraphQLString)}"
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