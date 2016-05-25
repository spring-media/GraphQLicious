//
//  ViewController.swift
//  GraphQLicious-sample
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import UIKit
import GraphQLicious

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /**
     Let's assume, we have the id of an article and we want to have the
     headline, body text and opener image of that article.
     
     First, let's create a fragment to fetch the contents
     of an image, namely the image `id` and the image `url`
     */
    let imageContent = Fragment(
      withAlias: "imageContent",
      name: "Image",
      fields: [
        "id",
        "url"
      ]
    )
    
    /**Next, let's embed the `Fragment` into a `Request` that gets the opener image.
     Note: Argument values that are of type String, are automatically represented with quotes.
     GraphQL also gives us the possibility to have custom enums as argument values. 
     All you have to do, is letting your enum implement ArgumentValue and you're good to go.
     */
    enum customEnum: String, ArgumentValue {
      case This = "this"
      case That = "that"
      
      var asGraphQLArgument: String {
        return rawValue // without quotes
      }
    }
    
    let customEnumArgument = Argument(
      key: "enum",
      values: [
        customEnum.This,
        customEnum.That
      ]
    )
    
    var imageContentRequest = Request(
      name: "images",
      arguments: [
        Argument(key: "role", value: "opener")
      ],
      fields: [
        imageContent
      ]
    )

    /**
     So now we have a request with an embedded fragment. Let's go one step further.
     If we want to, we can imbed that request into another fragment.
     (We can also embed fragments into fragments)
     
     Additionally to the opener image with its id and url we also want the headline and
     body text of the article.
     */
    let articleContent = Fragment(
      withAlias: "contentFields",
      name: "Content",
      fields: [
        "headline",
        "body",
        imageContentRequest
      ]
    )
    
    /**
     Finally, we put everything together as a query.
     A query always has a top level request to get everything started,
     and requires all the fragments that are used inside.
     */
    let q1 = Query(request: Request(
      withAlias: "test",
      name: "content",
      arguments: [
        Argument(key: "ids", values: [153082687]),
        customEnumArgument
      ],
      fields: [
        articleContent
      ]),
      fragments: [articleContent, imageContent]
    )
    
    /**
     All we have to do now is to call `create()` on our Query and we're good to go.
     */
    print(q1.create())
    debugPrint(q1)
    
    /**
     Let's assume, we want to change our username and our age in our backend and we want to have the 
     new name and age back to make sure everything went right.
     Let's assume further, our server provides a mutating method `editMe` for exactly that purpose.
     
     Let us first create the actual mutating request. We can use a normal `Request` for that
     - with a small twist.
     */
    
    let mutationRequest = Request(
      name: "editMe",
      arguments: [
        Argument(
          key: "input",
          values: [
            Value(withFields: [
              MutatingField(key: "name", value: "joe"),
              MutatingField(key: "age", value: 99)
              ]
            )
          ]
        )
      ],
      fields: [
        "name",
        "age"
      ]
    )
    
    /**
     We can then use a normal `Query` for that. The only difference is: We have to tell the query, 
     that it will be a `Mutation`
     */
    let mutation = Query(
      ofType: .Mutation,
      withAlias: "myMutation",
      request: mutationRequest
    )
    
    print(mutation.create())
    debugPrint(mutation)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
