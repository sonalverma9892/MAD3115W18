//
//  RegisterVCViewController.swift
//  LoginRegister
//
//  Created by MacStudent on 2018-02-21.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet var txtName: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Register"
        
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(displayValues))
        
        self.navigationItem.rightBarButtonItem = btnSubmit
        
    }
    
   @objc private func displayValues(){
        let infoAlert = UIAlertController(title: "Verify", message: "Please verify your details", preferredStyle: .alert)
    infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayWelcomeScreen()}))
        self.present(infoAlert, animated: true, completion: nil)
        
    }
    
    func displayWelcomeScreen(){
        
        let welcomeSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: "WelcomeScreen") as! WelcomeVC
        
        welcomeVC.welcomeTitle = txtName.text!
        
        navigationController?.pushViewController(welcomeVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
