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
    
    let urlFragment = Fragment(
      withAlias: "urlFragment",
      name: "Image",
      fields: [
        Request(
          name: "url",
          arguments: [
            Argument(key: "ratio", value: 1),
            Argument(key: "size", value: 200)
          ]
        )
      ]
    )
    
    let imageContent = Fragment(
      withAlias: "imageContent",
      name: "Image",
      fields: [
        "id",
        urlFragment
      ]
    )
    
    /**
     Next, let's embed the fragment into a request that gets the opener image
     */
    let imageContentRequest = Request(
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
    let q1 = Query(withRequest: Request(
      withAlias: "test",
      name: "content",
      arguments: [
        Argument(key: "ids", values: [153082687])
      ],
      fields: [
        articleContent
      ]),
      fragments: [articleContent, imageContent, urlFragment]
    )
    
    /**
     {
        test:content(id: 153082687){
          ...contentFields
        }
     }
     fragment contentFields on Content {
        headline,
        body,
        image(role: opener){
          ...imageContent
        }
     }
     fragment imageContent on Image {
        id,
        url
     }
     */
    print(q1.create())
    debugPrint(q1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
