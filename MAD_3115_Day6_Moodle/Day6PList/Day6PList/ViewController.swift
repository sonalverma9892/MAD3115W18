//
//  ViewController.swift
//  Day6PList
//
//  Created by Jigisha Patel on 2018-02-25.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtCarColor: UITextField!
    @IBOutlet var txtCarPlate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddNewAction(_ sender: UIButton) {
        self.writePropertyList()
    }
    
    @IBAction func btnListAllAction(_ sender: UIButton) {
        let listSB = UIStoryboard(name: "Main", bundle: nil)
        let listVC = listSB.instantiateViewController(withIdentifier: "CarListScreen")
    self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func writePropertyList(){
        let myCar = NSMutableDictionary()
        myCar["CarPlate"] = self.txtCarPlate.text
        myCar["CarColor"] = self.txtCarColor.text
        if let plistPath = Bundle.main.path(forResource: "Cars", ofType: "plist"){
            let carsplist = NSMutableArray(contentsOfFile: plistPath)
            carsplist?.add(myCar)
            if (carsplist?.write(toFile: plistPath, atomically: true))!{
                print("carslist : \(String(describing: carsplist))")
            }
            
        }else{
            print("Unable to locate plist file")
        }
        
        
        /*
        //create new dictionary element
        let newCar = NSMutableDictionary()
        
        //assign entered values to new dictionary element
        newCar["CarPlate"] = self.txtCarPlate.text
        newCar["CarColor"] = self.txtCarColor.text
        
        if let filePath = Bundle.main.path(forResource: "Cars", ofType: "plist") {
            
            //get an array representation of plist
            let plistArray = NSMutableArray(contentsOfFile: filePath)
            
            //add the new dictionary element in array
            plistArray?.add(newCar)
 
            //update the array into plist file
            let success = plistArray?.write(toFile: filePath, atomically: true)
            
            if success! {
                print("plistArray : \(String(describing: plistArray!.description))")
            }
        }
 */
    }
}

