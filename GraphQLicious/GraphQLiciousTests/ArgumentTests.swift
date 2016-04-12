//
//  ArgumentTests.swift
//  GraphQLiciousTests
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import XCTest
@testable import GraphQLicious

class ArgumentTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {

    super.tearDown()
  }
  
  func testArgumentWithOneValue() {
    let output = "ids: 153082687"
    let argument = Argument(key: "ids", value: 153082687)
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
  
  func testArgumentWithMultipleValues() {
    let output = "ids: [153082687,153082688]"
    let argument = Argument(key: "ids", values: [153082687, 153082688])
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
  
  func testArgumentWithEmptyValueString() {
    let output = "ids: "
    let argument = Argument(key: "ids", value: "")
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
  
  func testArgumentWithEmptyValueSequence() {
    let output = ""
    let argument = Argument(key: "ids", values: [])
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
  
  func testArgumentWithEmptyKeyString() {
    let output = ""
    let argument = Argument(key: "", values: [153082687])
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
  
  func testArgumentWithCustomArgumentValue() {
    class CustomArgumentValue: ArgumentValue {
      var asGraphQLString: String {
        return "test"
      }
    }
    let customArg = CustomArgumentValue()
    let output = "test: test"
    let argument = Argument(key: "test", value: customArg)
    
    XCTAssertEqual(argument.asGraphQLString, output, "Output doesn't match argument")
  }
}
