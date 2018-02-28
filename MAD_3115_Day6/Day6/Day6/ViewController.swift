//
//  ViewController.swift
//  Day6
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 Himauli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtCarColor: UITextField!
    @IBOutlet weak var txtCarPlate: UITextField!
    
    
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
    }
    
    func writePropertyList()
    {
        let myCar = NSMutableDictionary()
        myCar["CarPlate"] = self.txtCarPlate.text
        myCar["CarColor"] = self.txtCarColor.text
        
        if let plistPath = Bundle.main.path(forResource: "Cars", ofType: "plist")
        {
            let carplist = NSMutableArray(contentsOfFile: plistPath)
            carplist?.add(myCar)
            
            if (carplist?.write(toFile: plistPath, atomically: true))!{
                print("carlist : \(String(describing: carplist))")
            }
        }
        else
        {
            print("Unable to locate plist file")
        }
        //create new dictionary element
    }
    
}

