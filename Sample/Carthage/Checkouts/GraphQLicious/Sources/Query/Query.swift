//
//  Query.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/** Contains the complete GraphQL query and creates a String representation that can be read by GraphQL
 
 ***Example usage:***
 ```swift
 let query = Query(request: Request(
    name: "queryName",
    arguments: [
      Argument(key: "argument", values: [argumentValue1, argumentValue2])
    ],
    fields: [
      "fieldName",
      "fieldName",
      Request(
        name: "fieldName",
        arguments: [
          Argument(key: "argument", value: "argumentValue")
        ],
        fields: [
          "fieldName"
        ]
      )
    ]
 ))
 ```
 */
public struct Query: Operation {
  fileprivate let alias: String
  fileprivate let requests: [Request]
  fileprivate let fragments: [Fragment]
  fileprivate let queryType: QueryType
  
  public init(withAlias alias: String = "", request: Request, fragments: [Fragment] = []) {
    self.init(withAlias: alias, requests: [request], fragments: fragments)
  }
  
  public init(withAlias alias: String = "", requests: [Request], fragments: [Fragment]) {
    self.alias = alias
    self.requests = requests.map {$0}
    self.fragments = fragments
    self.queryType = .Query
  }
  
  public func create() -> String {
    return "query \(alias) {\(requests.map{$0.asGraphQLString}.joined(separator: ""))}\(fragments.map {$0.asGraphQLString}.joined(separator: ""))"
  }
}

/// Default CustomDebugStringConvertible implementation
extension Query {
  public var debugDescription: String {
    return "\nquery \(alias) {\n\t\(requests.map{$0.debugDescription}.joined(separator: "\n"))\n}\n\(fragments.map {$0.debugDescription}.joined(separator: ""))\n"
  }
}
