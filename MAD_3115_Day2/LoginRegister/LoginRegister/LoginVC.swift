//
//  LoginVC.swift
//  LoginRegister
//
//  Created by MacStudent on 2018-02-21.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnLoginAction(_ sender: UIBarButtonItem) {
        let Email = txtEmail.text
        let Password = txtPassword.text
        
        if(Email == "test" && Password == "test"){
            let infoAlert = UIAlertController(title: "Login Successfull", message: "You are Authenticated", preferredStyle: .alert)
            
            infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(infoAlert, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func btnRegisterAction(_ sender: UIBarButtonItem) {
        let registerSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerVC = registerSB.instantiateViewController(withIdentifier: "RegistrationScreen")
        
//         self.present(registerVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    
    
    
}

