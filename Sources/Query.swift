//
//  Query.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/** Contains the complete GraphQL query and creates a query String that can be read by GraphQL
 
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
public struct Query {
  public let request: Request
  public let fragments: [Fragment]
  
  public init(withRequest request: Request, fragments: [Fragment] = []) {
    self.request = request
    self.fragments = fragments
  }
  
  /**
   Creates query String that can be interpreted by GraphQL
   
   - returns: A GraphQL readable query String
  */
  public func create() -> String {
    return "{\(request.asGraphQLString)}\(fragments.map {$0.asGraphQLString}.joinWithSeparator(""))"
  }
}

extension Query: CustomDebugStringConvertible {
  public var debugDescription: String {
    return "\n{\n\t\(request.debugDescription)\n}\n\(fragments.map {$0.debugDescription}.joinWithSeparator(""))\n"
  }
}