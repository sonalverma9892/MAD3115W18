//
//  ViewController.swift
//  Sonal_C0726246_MAD3115_MT
//
//  Created by MacStudent on 2018-02-28.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var switchRemember: UISwitch!
    
    @IBAction func switchRememberAction(_ sender: UISwitch) {
        if self.switchRemember.isOn {
            self.saveData()
            let infoAlert = UIAlertController(title: "Switch is ON", message: "Your details are saved", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
        }else{
            self.removeData()
            let infoAlert = UIAlertController(title: "Switch is OFF", message: "Your details are NOT saved", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLoginAction(_ sender: UIButton) {
        if (txtUsername.text == "test" && txtPassword.text == "test"){
             displayInventoryScreen()
    }
}
    
    
    func displayInventoryScreen() {
        let InventorySB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let inventoryVC = InventorySB.instantiateViewController(withIdentifier: "InventoryScreen")
        navigationController?.pushViewController(inventoryVC, animated: true)
    }
    
    func saveData(){
        UserDefaults.standard.set(self.txtUsername.text,forKey: "userName")
        UserDefaults.standard.set(self.txtPassword.text,forKey:"password" )
    }
    
    func removeData(){
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

