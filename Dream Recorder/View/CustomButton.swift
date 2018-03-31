//
//  customButton.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 10/11/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib() //necessary
        
        layer.cornerRadius = 5.0
        
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
        
    }

}
