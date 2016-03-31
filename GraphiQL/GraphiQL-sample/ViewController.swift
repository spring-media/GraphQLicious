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
    
    print(request.createQuery())
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
