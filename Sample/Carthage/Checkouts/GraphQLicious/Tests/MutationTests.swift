//
//  MutationTests.swift
//  GraphQLicious
//
//  Created by Felix Dietz on 27/05/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import XCTest
@testable import GraphQLicious
class MutationTests: XCTestCase {
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testEmptyMutation() {
    let output = "mutation {()}"
    let mutation = Mutation(mutatingRequest: Request(
      name: "",
      arguments: [Argument(key: "", value: "")],
      fields: []
    )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyName() {
    let output = "mutation {(name: \"joe\"){name}}"
    let mutation = Mutation(mutatingRequest: Request(
      name: "",
      arguments: [Argument(key: "name", value: "joe")],
      fields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyArgument() {
    let output = "mutation {mutate(){name}}"
    let mutation = Mutation(mutatingRequest: Request(
      name: "mutate",
      arguments: [ Argument(key: "", value: "") ],
      fields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyField() {
    let output = "mutation {mutate(name: \"joe\")}"
    let mutation = Mutation(mutatingRequest: Request(
      name: "mutate",
      arguments: [ Argument(key: "name", value: "joe") ],
      fields: []
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithAlias() {
    let output = "mutation {test:mutate(name: \"joe\"){name}}"
    let mutation = Mutation(mutatingRequest: Request(
      withAlias: "test",
      name: "mutate",
      arguments: [ Argument(key: "name", value: "joe") ],
      fields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testComplexMutation() {
    let output = "mutation {alias:test(input: {\n\t\tname: \"joe\",age: 99\n}){name,image(role: \"opener\"){id,homeSection{displayName},url(ratio: 1.777,size: 200)}}}"
    let mutation = Mutation(mutatingRequest: Request(
      withAlias: "alias",
      name: "test",
      arguments: [ Argument(
        key: "input",
        value: ObjectValue(
          keyValuePairs: [
            ObjectKeyValuePair(key: "name", value: "joe"),
            ObjectKeyValuePair(key: "age", value: 99)
          ]
        )
      )],
      fields: [
        "name",
        Request(
          name: "image",
          arguments: [
            Argument(key: "role", value: "opener")
          ],
          fields: [
            "id",
            Request(
              name: "homeSection",
              arguments: [],
              fields: [
                "displayName"
              ]
            ),
            Request(
              name: "url",
              arguments: [
                Argument(key: "ratio", value: 1.777),
                Argument(key: "size", value: 200)
              ]
            )
          ]
        )
      ])
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
}