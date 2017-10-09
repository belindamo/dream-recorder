//
//  RecordVC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("back")
    }
    


}
