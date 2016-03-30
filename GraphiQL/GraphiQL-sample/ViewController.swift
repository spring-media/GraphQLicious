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
    
    let request: Request = Request(
      name: "content",
      arguments: [
        "ids": 153082687
      ],
      fields: [
        .Simple("id"),
        .Simple("headline"),
        .Complex(Request(
          name: "image",
          arguments: [
            "role": "opener"
          ],
          fields: [
            Field.Simple("id")
          ]
          )
        )
      ])
    
    print(request.createQuery())

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

