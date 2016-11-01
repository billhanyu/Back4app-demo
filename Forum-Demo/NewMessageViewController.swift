//
//  NewMessageViewController.swift
//  Forum-Demo
//
//  Created by Bill Yu on 11/1/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import Foundation
import UIKit
import Parse

class NewMessageController: UIViewController {
    
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBAction func saveMessage(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["content"] = messageTextView.text
        message.saveInBackground()
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
}
