//
//  ReadingRequest.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

public struct ReadingRequest: Request {
  public let alias: String
  public let name: String
  public let arguments: [GraphQLConvertible]
  public let fields: [Field]
  
  public init(withAlias alias: String = "", name: String, arguments: [Argument] = [], fields: [Field] = []) {
    self.alias = alias.withoutWhiteSpaces
    self.name = name.withoutWhiteSpaces
    self.arguments = arguments.map{$0}
    self.fields = fields
  }
}