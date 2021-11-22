//
//  ViewController.swift
//  Study Guide
//
//  Created by Erick Sanchez on 11/1/21.
//

import UIKit

struct PersonInfo: Codable {
    let name: String
    let age: Int
    let height: CGFloat // inches
}

let userPassword = "This!sNOTaGoodpassword"

let imageProfile = UIImage(named: "box")!

let preferences: [String: Any] = [
    "FIRST_TIME_LAUNCH": false,
    "COLORS": [
        [
            "first": "blue",
            "second": "green",
        ],
        [
            "first": "orange",
            "second": "yellow",
        ],
        [
            "first": "green",
            "second": "yellow",
        ],
    ]
]

let randomData = "SJI$#J*(GJDS*(G S)(FSDJ)(FJ DSF()@! HFDS".data(using: .utf8)!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO: test each wrapper with the data at the top of this Swift file
        
    }
    
}
