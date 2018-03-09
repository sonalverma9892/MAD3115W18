//
//  MasterTVC.swift
//  Split
//
//  Created by Jigisha Patel on 2018-03-06.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

protocol MusicSelectionDelegate: class {
    func musicSelected(_ newMusic: String)
}

class MasterTVC: UITableViewController {

    var music = ["Item 1","Item 2","Item 3", "Item 4"]
    
    var delegate: MusicSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.music.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = music[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedMusic = music[indexPath.row]
        
        delegate?.musicSelected(selectedMusic)
        
        if let detailVC = delegate as? DetailVC{
            splitViewController?.showDetailViewController(detailVC, sender: nil)
        }
    }
}
