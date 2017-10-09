//
//  HomeTableView.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/29/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit

class HomeTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib() //necessary
        
        //so that it's grey when pulled down or up
        let backView = UIView(frame: self.bounds)
        backView.backgroundColor = UIColor(red: (253.0/255.0), green: (253.0/255.0), blue: (253.0/255.0), alpha: CGFloat(1.0)) // or whatever color
        self.backgroundView = backView
    }

}
