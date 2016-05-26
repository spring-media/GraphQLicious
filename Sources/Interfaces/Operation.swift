//
//  Operation.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public protocol Operation: CustomDebugStringConvertible {
  var alias: String { get }
  var request: Request { get }
  var fragments: [Fragment] { get }
  var queryType: QueryType { get }
}

extension Operation {
  /**
   Creates query String that can be interpreted by GraphQL
   
   - returns: A GraphQL readable query String
   */
  public func create() -> String {
    return "\(queryType.rawValue) \(alias) {\(request.asGraphQLString)}\(fragments.map {$0.asGraphQLString}.joinWithSeparator(""))"
  }

}

extension Operation {
  public var debugDescription: String {
    return "\n\(queryType.rawValue) \(alias) {\n\t\(request.debugDescription)\n}\n\(fragments.map {$0.debugDescription}.joinWithSeparator(""))\n"
  }
}