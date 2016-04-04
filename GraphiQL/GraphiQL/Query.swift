//
//  Query.swift
//  GraphiQL
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

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
  
  public init(withRequest request: Request) {
    self.request = request
  }
  
  /**
   Creates query String that can be interpreted by GraphQL
   
   - returns: A GraphQL readable query String
  */
  public func create() -> String {
    return "{\(request.graphQLString)}"
  }
}
