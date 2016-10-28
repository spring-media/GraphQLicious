//
//  Field.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/// A Field with a customized textual representation suitable for GraphQL.
public protocol Field: GraphQLConvertible, CustomDebugStringConvertible {
  /// A GraphQL Field representation of `self`.
  var asGraphQLField: String { get }
}

extension Field {
  public var asGraphQLField: String {
    return asGraphQLString
  }
  
  public var debugDescription: String {
    return asGraphQLField
  }
}

extension String: Field {
  public var asGraphQLString: String {
    return self
  }
  
  public var asGraphQLField: String {
    return self.withoutQuotes
  }
}

extension Int: Field {
  public var asGraphQLString: String {
    return description
  }
}

extension Float: Field {
  public var asGraphQLString: String {
    return description
  }
}

extension Double: Field {
  public var asGraphQLString: String {
    return description
  }
}

extension Bool: Field {
  public var asGraphQLString: String {
    return description
  }
}
