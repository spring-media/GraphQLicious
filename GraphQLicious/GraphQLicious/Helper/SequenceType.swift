//
//  SequenceType.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation
extension SequenceType where Generator.Element: GraphQLConvertible {
  public var asGraphQLString: String {
    return map { element in
      element.asGraphQLString
      }.joinWithSeparator(",")
  }
}