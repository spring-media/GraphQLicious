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
  var stringRepresentation: String { get }
}

// TODO: Check for fix in Xcode 7.3
extension Array where Element: GraphQLStringConvertible {
  var stringRepresentation: String {
    return map { element in
      element.stringRepresentation
    }.joinWithSeparator(",")
  }
}

extension Int: GraphQLStringConvertible {
  public var stringRepresentation: String {
    return self.description
  }
}

extension Float: GraphQLStringConvertible {
  public var stringRepresentation: String {
    return self.description
  }
}

extension String: GraphQLStringConvertible {
  public var stringRepresentation: String {
    return self
  }
}
