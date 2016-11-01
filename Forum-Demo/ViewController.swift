//
//  ViewController.swift
//  Forum-Demo
//
//  Created by Bill Yu on 11/1/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var messages: [String] = []
    final var ReuseID_EntryCell = "EntryCell"
    final var Message_Class = "Message"
    final var Content_Name = "content"
    final var CellNib_Name = "EntryCellView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: CellNib_Name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ReuseID_EntryCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshData()
    }
    
    private func refreshData() {
        let query = PFQuery(className: Message_Class)
        query.findObjectsInBackground { (results, error) in
            if let results = results {
                self.messages.removeAll()
                for message in results {
                    if let content = message[self.Content_Name] as? String {
                        self.messages.append(content)
                    }
                }
                self.tableView.reloadData()
            }
            else if let error = error {
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseID_EntryCell) as! EntryCell
        cell.setMessage(messages[indexPath.row])
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

