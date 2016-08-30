//
//  ObjectValue.swift
//  GraphQLicious
//
//  Created by Monaco, Vittorio on 30/08/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct ObjectValue: ArgumentValue {
  private let keyValuePairs: [Argument]
  
  public init(keyValuePairs: [Argument]) {
    self.keyValuePairs = keyValuePairs
  }
  
  public var asGraphQLArgument: String {
    let arguments = keyValuePairs.isEmpty ? "" : "\(keyValuePairs.map {$0.asGraphQLString}.joinWithSeparator(","))"
    return "{\n\t\t\(arguments)\n}"
  }
}

public typealias ObjectKeyValuePair = Argument