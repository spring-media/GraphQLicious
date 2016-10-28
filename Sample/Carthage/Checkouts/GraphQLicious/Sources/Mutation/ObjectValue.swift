//
//  ObjectValue.swift
//  GraphQLicious
//
//  Created by Monaco, Vittorio on 30/08/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/// A value that can be used as a mutation input (e.g. https://facebook.github.io/relay/graphql/mutations.htm), consisting of a complex object with key value pairs
public struct ObjectValue: ArgumentValue {
  private let keyValuePairs: [Argument]
  
  public init(keyValuePairs: [Argument]) {
    self.keyValuePairs = keyValuePairs
  }
  
  public var asGraphQLArgument: String {
    let arguments = keyValuePairs.isEmpty ? "" : "\(keyValuePairs.map {$0.asGraphQLString}.joined(separator: ","))"
    return "{\n\t\t\(arguments)\n}"
  }
}

/// A key-value pair that can be used with an `ObjectValue`
public typealias ObjectKeyValuePair = Argument
