//
//  ContactDetailVC.swift
//  Day9CollectionTabBar
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import CallKit
import MessageUI

class ContactDetailVC: UIViewController {
    

    @IBOutlet var imgCat: UIImageView!
    @IBOutlet var lblCall: UILabel!
    @IBOutlet var lblText: UILabel!
    @IBOutlet var lblEmail: UILabel!
    
    @IBAction func btnCallAction(_ sender: UIButton) {
        print("Calling.......")
        let url = URL(string: "tel://+11231231231")
        if UIApplication.shared.canOpenURL(url!){
            if #available(iOS 10, *){
                UIApplication.shared.open(url!)
            }
            else{
                UIApplication.shared.openURL(url!)
            }
        }
    }
    
    @IBAction func btnTextAction(_ sender: UIButton) {
        print("Messaging...")
        if
            MFMessageComposeViewController.canSendText(){
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hello, How are uou?"
            messageVC.recipients  = ["+11231231231"]
            messageVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            self.present(messageVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnEmailAction(_ sender: UIButton) {
        print("sending email.....")
        if
            MFMailComposeViewController.canSendMail(){
            let EmailPicker = MFMailComposeViewController()
            
            EmailPicker.mailComposeDelegate = self
            EmailPicker.setSubject("Test Email")
            EmailPicker.setMessageBody("Hello, How are you?", isHTML: true)
            
            self.present(EmailPicker, animated: true, completion: nil)
        }else{
            print("Can't send email....")
        }
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

extension ContactDetailVC: MFMailComposeViewControllerDelegate{
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?){
        controller.dismiss(animated: true, completion: nil)
    }
}
