//
//  Operation.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/// A GraphQL Operation
public protocol Operation: CustomDebugStringConvertible {
  /**
   Creates query String that can be interpreted by GraphQL
   
   - returns: A GraphQL readable query String
   */
  func create() -> String
}