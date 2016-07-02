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
    let output = "mutation  {()}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      mutationName: "",
      mutatingArgument: MutatingArgument(key: "", mutatingValue: ""),
      responseFields: []
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyName() {
    let output = "mutation  {(name: \"joe\"){name}}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      mutationName: "",
      mutatingArgument: MutatingArgument(key: "name", mutatingValue: "joe"),
      responseFields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyArgument() {
    let output = "mutation  {mutate(){name}}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      mutationName: "mutate",
      mutatingArgument: MutatingArgument(key: "", mutatingValue: ""),
      responseFields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithEmptyField() {
    let output = "mutation  {mutate(name: \"joe\")}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      mutationName: "mutate",
      mutatingArgument: MutatingArgument(key: "name", mutatingValue: "joe"),
      responseFields: []
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testMutationWithAlias() {
    let output = "mutation  {test:mutate(name: \"joe\"){name}}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      withAlias: "test",
      mutationName: "mutate",
      mutatingArgument: MutatingArgument(key: "name", mutatingValue: "joe"),
      responseFields: [
        "name"
      ]
      )
    )
    XCTAssertEqual(mutation.create(), output, "Output doesn't match request")
  }
  
  func testComplexMutation() {
    let output = "mutation  {alias:test(input: {name: \"joe\",age: 99}){name,image(role: \"opener\"){id,homeSection{displayName},url(ratio: 1.777,size: 200)}}}"
    let mutation = Mutation(mutatingRequest: MutatingRequest(
      withAlias: "alias",
      mutationName: "test",
      mutatingArgument: MutatingArgument(
        key: "input",
        mutatingValue: MutatingValue(
          withFields: [
            MutatingField(name: "name", value: "joe"),
            MutatingField(name: "age", value: 99)
          ]
        )
      ),
      responseFields: [
        "name",
        ReadingRequest(
          name: "image",
          arguments: [
            Argument(key: "role", value: "opener")
          ],
          fields: [
            "id",
            ReadingRequest(
              name: "homeSection",
              arguments: [],
              fields: [
                "displayName"
              ]
            ),
            ReadingRequest(
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