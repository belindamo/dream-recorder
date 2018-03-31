//
//  EditVC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 10/9/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    @IBOutlet weak var saveAudioSwitch: UISwitch!
    @IBOutlet weak var tagsField: UITextField!
    @IBOutlet weak var dreamFragButton: UIButton!
    
    var entryToEdit: Entry!
    var content: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if content != nil {
            contentField.text = content
        }
        
        if entryToEdit != nil {
            loadEntryData()
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: scrollView.contentSize.height+150)
        
        self.titleField.layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        
        self.contentField.layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        self.contentField.layer.borderWidth = 0.5
        self.contentField.layer.cornerRadius = 5.0
        
        
        self.tagsField.layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor

    }
    
    func loadEntryData() {
        if let entry = entryToEdit{
            titleField.text = entry.title
            contentField.text = entry.content
            
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        //save all the info in the fields.
        //go to home
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil) //goes back to entry
    }
    
}
