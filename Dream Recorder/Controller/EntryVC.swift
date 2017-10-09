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
    
//    override func viewDidLayoutSubviews() {
//
//        super.viewDidLayoutSubviews()
//        
//        let sizeThatFitsTextView = content.sizeThatFits(CGSize(width: content.frame.size.width, height:10000000000.0))
//        contentHeight.constant = sizeThatFitsTextView.height
////
////        let contentSize: CGSize = self.content.sizeThatFits(self.content.bounds.size)
////        var frame = self.content.frame
////        frame.size.height = contentSize.height
////        self.content.frame = frame
////
////        let contentAspectRatio = NSLayoutConstraint(item: self.content, attribute: .height, relatedBy: .equal, toItem: self.content, attribute: .width, multiplier: content.bounds.height/content.bounds.width, constant: 1)
////        self.content.addConstraint(contentAspectRatio)
//        
//    }
}
