//
//  EntryCell.swift
//  Forum-Demo
//
//  Created by Bill Yu on 11/1/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import UIKit

class EntryCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
    func setMessage(_ msg: String) {
        label.text = msg
        label.setNeedsLayout()
        self.setNeedsLayout()
    }
    
}
