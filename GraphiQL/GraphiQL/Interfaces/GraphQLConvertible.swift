//
//  GraphQLConvertible.swift
//  GraphiQL
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

public protocol GraphQLConvertible {
  var asGraphQLString: String { get }
}