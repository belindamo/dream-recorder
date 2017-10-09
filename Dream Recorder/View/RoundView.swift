//
//  RoundView.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class RoundView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib() //necessary
        
//        self.layer.borderColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.6).cgColor
//        self.layer.borderWidth = 1.0
        
        layer.cornerRadius = 8.0
        
    }

}
