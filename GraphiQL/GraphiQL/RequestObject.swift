//
//  RequestObject.swift
//  GraphiQL
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct RequestObject {
  public let request: Request
  
  public init(withRequest request: Request) {
    self.request = request
  }
  
  public func createQuery() -> String {
    return "{\(request.graphQLString)}"
  }
}
