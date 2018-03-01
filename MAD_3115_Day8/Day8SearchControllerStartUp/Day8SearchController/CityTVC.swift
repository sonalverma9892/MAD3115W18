//
//  CityTVC.swift
//  Day8SearchController
//
//  Created by Jigisha Patel on 2018-02-23.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class CityTVC: UITableViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if mySearchController.searchBar.text! == ""{
            self.filteredCityList = cityList
        }else{
            filteredCityList = cityList.filter({$0.city.lowercased().contains(mySearchController.searchBar.text!.lowercased())})
        }
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(serachBar: UISearchBar){
        self.tableView.reloadData()
    }
    
        
    var filteredCityList = cityList
    let mySearchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        mySearchController.searchResultsUpdater = self
        mySearchController.dimsBackgroundDuringPresentation = false
        mySearchController.definesPresentationContext = true
        tableView.tableHeaderView = mySearchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell

        // Configure the cell...
        let row = indexPath.row
        
        cell.lblCity.text = filteredCityList[row].city
        cell.lblProvince.text = filteredCityList[row].province
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let location = "\(filteredCityList[row].city), \(filteredCityList[row].province)"
        print("location : \(location)")
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

