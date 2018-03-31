//
//  EntryVC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class EntryVC: UIViewController {

    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var contentField: UITextView!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var emotionImage: UIImageView!
    
    var entryToView: Entry!
        
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editPressed(_ sender: Any) {
        performSegue(withIdentifier: "editExistingEntry", sender: entryToView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentField.isEditable = false
        loadEntryData()
    }
    
    func loadEntryData() {
        if let entry = entryToView {
            titleField.text = entry.title
            contentField.text = entry.content
            dateField.text = "8/20/2017 8:01am"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editExistingEntry" {
            if let destination = segue.destination as? EditVC {
                if let entry = sender as? Entry {
                    destination.entryToEdit = entry
                }
            }
        }
    }
    

}
