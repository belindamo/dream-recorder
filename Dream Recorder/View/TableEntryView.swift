//
//  TableEntryView.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class TableEntryView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib() //necessary
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0 //how far it blurs out
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0) //how far the shadow goes
        layer.cornerRadius = 5.0
        
    }
}
