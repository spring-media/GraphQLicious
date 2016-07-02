//
//  QueryType.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 25/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

/// The type of a GraphQL query
public enum QueryType: String {
  case Query = "query"
  case Mutation = "mutation"
}