//
//  Field.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

/**
 Field that can be read by GraphQL
 */
public protocol Field: GraphQLConvertible, CustomDebugStringConvertible {
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