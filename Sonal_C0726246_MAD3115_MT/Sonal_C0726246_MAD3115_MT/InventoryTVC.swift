//
//  InventoryTVC.swift
//  Sonal_C0726246_MAD3115_MT
//
//  Created by MacStudent on 2018-02-28.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit

class InventoryTVC: UITableViewController {
    
    
    var plistArray = NSMutableArray()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Product Detail"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchValuesFromPlist()
        
        tableView.rowHeight = 200

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return self.plistArray.count
    }
    func fetchValuesFromPlist(){
        if let filePath = Bundle.main.path(forResource: "product", ofType: "plist") {
            
            //get an array representation of plist
            plistArray = NSMutableArray(contentsOfFile: filePath)!
            
            print("plistArray \(plistArray)")
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! InventoryTVCell

        // Configure the cell...
        let dictProduct = plistArray[indexPath.row] as! NSMutableDictionary
        cell.txtProductNo?.text = dictProduct.value(forKey: "ProductNumber") as! String
        cell.txtProductName?.text = dictProduct.value(forKey: "ProductName") as? String
       // cell.imageView?.image = dictProduct.value(forKey: "ProductImage") as? UIImage
        cell.txtQuantity?.text = dictProduct.value(forKey: "Quantity") as? String
        cell.txtRemark?.text = dictProduct.value(forKey: "Remarks") as? String

        return cell
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
