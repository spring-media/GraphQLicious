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
 let request = RequestObject(withRequest: Request(
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
  public let alias: String
  public let request: Request
  public let fragments: [Fragment]
  public let queryType: QueryType
  
  public init(withAlias alias: String = "", readingRequest request: Request, fragments: [Fragment] = []) {
    self.alias = alias
    self.request = request
    self.fragments = fragments
    self.queryType = .Query
  }
}

