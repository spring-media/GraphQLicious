//
//  MutatingRequest.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 26/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public struct MutatingRequest: Request {
  public let alias: String
  public let name: String
  public let arguments: [Argument]
  public let fields: [Field]
  
  public init(withAlias alias: String = "", mutationName name: String, mutationArgument argument: Argument, responseFields fields: [Field]) {
    self.alias = alias
    self.name = name
    self.arguments = [argument]
    self.fields = fields
  }
}