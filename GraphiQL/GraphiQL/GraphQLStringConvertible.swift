//
//  GraphQLStringConvertible.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public protocol GraphQLStringConvertible {
  /// A textual representation of `self`.
  var graphQLString: String { get }
}


extension SequenceType where Generator.Element: GraphQLStringConvertible {
  var graphQLString: String {
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

extension String: GraphQLStringConvertible {
  public var graphQLString: String {
    return self
  }
}
