//
//  GraphQLStringConvertible.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/**
 Provides a String representation that can be interpreted by GraphQL
*/
public protocol GraphQLStringConvertible {
  /// A String representation of `self` that can be interpreted by GraphQL
  var graphQLString: String { get }
}

extension SequenceType where Generator.Element: GraphQLStringConvertible {
  public var graphQLString: String {
    return map { element in
      element.graphQLString
      }.joinWithSeparator(",")
  }
}

extension Int: GraphQLStringConvertible {
  public var graphQLString: String {
    return self.description
  }
}

extension Float: GraphQLStringConvertible {
  public var graphQLString: String {
    return self.description
  }
}

extension Double: GraphQLStringConvertible {
  public var graphQLString: String {
    return self.description
  }
}
