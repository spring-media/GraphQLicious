//
//  Mutation.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/** Contains the complete GraphQL mutation and creates a String representation that can be read by GraphQL
 
 ***Example usage:***
 ```swift
 let mutationRequest = Request(
    name: "editMe",
    arguments: [
      Argument(
        key: "input",
        value: [
          ObjectValue(keyValuePairs: [
              ObjectKeyValuePair(key: "name", value: "joe"),
              ObjectKeyValuePair(key: "age", value: 99)
            ]
          )
        ]
      )
    ],
    fields: [
      "name",
      "age"
    ]
 )

 ```
 */
public struct Mutation: Operation {
  private let alias: String
  private let request: Request
  private let fragments: [Fragment]
  private let queryType: QueryType

  public init(withAlias alias: String = "", mutatingRequest request: Request, fragments: [Fragment] = []) {
    self.alias = alias
    self.request = request
    self.fragments = fragments
    self.queryType = .Mutation
  }
  
  public func create() -> String {
    let completeAlias = alias.isEmpty ? "" : "\(alias) "
    return "mutation \(completeAlias){\(request.asGraphQLString)}\(fragments.map {$0.asGraphQLString}.joinWithSeparator(""))"
  }
}

/// Default CustomDebugStringConvertible implementation
extension Mutation {
  public var debugDescription: String {
    return "\nmutation \(alias) {\n\t\(request.debugDescription)\n}\n\(fragments.map {$0.debugDescription}.joinWithSeparator(""))\n"
  }
}