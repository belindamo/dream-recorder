//
//  CircleView.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.bounds.size.width / 2.0
        
        self.layer.cornerRadius = radius
        clipsToBounds = true
    }
    
}
