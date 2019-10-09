//
//  InfoVC.swift
//  Pension Calculator
//
//  Created by Arya Tschand on 8/22/19.
//  Copyright © 2019 Arya Tschand. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var InfoText: UITextView!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        InfoText.text = text
    }

}
