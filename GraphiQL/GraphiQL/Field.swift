//
//  Field.swift
//  GraphiQL
//
//  Created by Felix Dietz on 31/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public enum Field: GraphQLStringConvertible {
  case Simple(String)
  case Complex(Request)
  
  public var stringRepresentation: String {
    switch self{
    case .Simple(let string):
      return string
    case .Complex(let request):
      return request.stringRepresentation
    }
  }
}
