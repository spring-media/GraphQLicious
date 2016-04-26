//
//  String.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import Foundation

extension String: Field {
  public var asGraphQLString: String {
    return self
  }
  public var asGraphQLField: String {
    return self.withoutQuotes
  }
}

extension String: ArgumentValue {}

extension String {
  public var withQuotes: String {
    return "\"\(self)\""
  }
  public var withoutQuotes: String {
    return self.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
  }
}

extension String {
  var withoutWhiteSpaces: String {
    return self.replace(" ", with: "")
  }
  
  private func replace(string: String, with replacement: String) -> String {
    return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
  }
}