//
//  EntryCell.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/27/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var emotion: UIImageView!
    
    func configureCell(entry: Entry) {
        date.text = "Jun 27"
        time.text = "08:30pm"
        //manipulte entry's date object to get month, day, time
        
        title.text = entry.title
        content.text = entry.content
        emotion.image = UIImage(named:"\(entry.emotion)")
        
    }

}
