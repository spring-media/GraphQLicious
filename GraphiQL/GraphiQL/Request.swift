//
//  Request.swift
//  GraphiQL
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public enum Field: CustomStringConvertible{
  case Simple(String)
  case Complex(Request)
  
  public var description: String {
    get {
      switch self{
      case .Simple(let string):
        return string
      case .Complex(let request):
        return request.description
      }
    }
  }
}

public struct Request {
  
  public let name: String
  public let arguments: [String: AnyObject]
  public let fields: [Field]
  
  public init(name: String, arguments: [String: AnyObject], fields: [Field]) {
    self.name = name
    self.arguments = arguments
    self.fields = fields
  }
  
  public func createQuery() -> String {
    
    var stringToReturn = "{"
    stringToReturn += self.description
    stringToReturn += "}"
    return stringToReturn
  }
}

extension Request: CustomStringConvertible {
  public var description: String {
    get {
      var stringToReturn = name
      stringToReturn += "("
      
      for (key, value) in arguments {
        stringToReturn += "\(key): \(value)"
        stringToReturn += ","
      }
      
      stringToReturn = stringToReturn.substringToIndex(stringToReturn.endIndex.predecessor())
      stringToReturn += "){"
      
      for field in fields{
        stringToReturn += field.description
        stringToReturn += ","
      }
      
      stringToReturn = stringToReturn.substringToIndex(stringToReturn.endIndex.predecessor())
      stringToReturn += "}"
      return stringToReturn
    }
  }
}