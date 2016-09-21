//
//  String.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

extension String {
  /// Representation of `self` with surrounding quotes
  public var withQuotes: String {
    return "\"\(self)\""
  }
  /// Representation of `self` without any quotes
  public var withoutQuotes: String {
    return self.replace("\"", with: "")
  }
  
  /// Representation of `self` without any white spaces
  var withoutWhiteSpaces: String {
    return self.replace(" ", with: "")
  }
  
  private func replace(_ string: String, with replacement: String) -> String {
    return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
  }
}
