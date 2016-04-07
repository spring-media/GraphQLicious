//
//  ViewController.swift
//  GraphiQL-sample
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

import UIKit
import GraphiQL

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = Fragment(
      withAlias: "imageFields",
      name: "Image",
      fields: [
        "id",
        Request(
          name: "url",
          arguments: [
            Argument(key: "size", value: 200),
            Argument(key: "ratio", value: 1)
          ]
        )
      ]
    )
    
    let content = Fragment(
      withAlias: "contentFields",
      name: "Content",
      fields: [
        "id",
        "headline",
        Request(
          name: "images",
          arguments: [
            Argument(key: "role", value: "opener")
          ],
          fields: [
            image
          ]
        )
      ]
    )
    
    
    
    let q1 = Query(withNode: Request(
      withAlias: "test",
      name: "content",
      arguments: [
        Argument(key: "ids", values: [153082687])
      ],
      fields: [
        content
      ]),
                   fragments: [content, image]
    )
    
    print(q1.create())
    
    let query = Query(withNode: Request(
      name: "content",
      arguments: [
        Argument(key: "ids", values: [153082687])
      ],
      fields: [
        "id",
        "headline",
        Request(
          name: "images",
          arguments: [
            Argument(key: "role", value: "opener")
          ],
          fields: [
            "id"
          ]
        )
      ]
      )
    )
    print(query.create())
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
