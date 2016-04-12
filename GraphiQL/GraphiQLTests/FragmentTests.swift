//
//  FragmentTests.swift
//  GraphiQL
//
//  Created by Felix Dietz on 07/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import XCTest
import GraphiQL

class FragmentTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testEmptyFragmentGraphQlString() {
    let output = "..."
    let fragment = Fragment(withAlias: "", name: "", fields: [])
    XCTAssertEqual(fragment.asGraphQLField, output, "Output doesn't match fragment")
  }
  
  func testEmptyFragmentDeclarationString() {
    let output = "fragment  on  "
    let fragment = Fragment(withAlias: "", name: "", fields: [])
    XCTAssertEqual(fragment.asGraphQLString, output, "Output doesn't match fragment")
  }
  
  func testValidFragmentGraphQLString() {
    let output = "...test"
    let fragment = Fragment(withAlias: "test", name: "test", fields: ["test"])
    XCTAssertEqual(fragment.asGraphQLField, output, "Output doesn't match fragment")
  }
  
  func testValidFragmentDeclarationString() {
    let output = "fragment test on test {test}"
    let fragment = Fragment(withAlias: "test", name: "test", fields: ["test"])
    XCTAssertEqual(fragment.asGraphQLString, output, "Output doesn't match fragment")
  }
}