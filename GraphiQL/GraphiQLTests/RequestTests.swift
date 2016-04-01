//
//  RequestTests.swift
//  GraphiQL
//
//  Created by Felix Dietz on 01/04/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import XCTest
@testable import GraphiQL

class RequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
  func testEmptyRequest() {
    let output = "{}"
    let request = Request(
      name: "",
      arguments: [
      ],
      fields: [
      ])
    
    XCTAssertEqual(request.createQuery(), output, "Output doesn't match request")
  }
  
  func testRequestWithEmptyName() {
    let output = "{(ids: 153082687){id,headline}}"
    let request = Request(
      name: "",
      arguments: [
        Argument(key: "ids", value: 153082687)
      ],
      fields: [
        "id",
        "headline",
      ])
    
    XCTAssertEqual(request.createQuery(), output, "Output doesn't match request")
  }
  
  func testRequestWithEmptyArguments() {
    let output = "{content{id,headline}}"
    let request = Request(
      name: "content",
      arguments: [
      ],
      fields: [
        "id",
        "headline",
      ])
    
    XCTAssertEqual(request.createQuery(), output, "Output doesn't match request")
  }
  
  func testRequestWithEmptyFields() {
    let output = "{content(ids: 153082687)}"
    let request = Request(
      name: "content",
      arguments: [
        Argument(key: "ids", value: 153082687)
      ],
      fields: [
      ])
    
    XCTAssertEqual(request.createQuery(), output, "Output doesn't match request")
  }
  
  func testComplexRequest() {
    let output = "{content(ids: 153082687){id,headline,image(role: opener){id}}}"
    let request = Request(
      name: "content",
      arguments: [
        Argument(key: "ids", value: 153082687)
      ],
      fields: [
        "id",
        "headline",
        Request(
          name: "image",
          arguments: [
            Argument(key: "role", value: "opener")
          ],
          fields: [
            "id"
          ]
        )
      ])
    
    XCTAssertEqual(request.createQuery(), output, "Output doesn't match request")
  }
}
