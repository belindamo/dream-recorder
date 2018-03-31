//
//  SettingsVC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 10/9/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func toHomePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewPostPressed(_ sender: Any) {
        performSegue(withIdentifier: "newPostFromSettings", sender: nil)
    }
}
