//
//  InventoryVC.swift
//  Sonal_C0726246_MAD3115_MT
//
//  Created by MacStudent on 2018-02-28.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit

class InventoryVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblProductNumber: UILabel!
    @IBOutlet weak var productNumberPicker: UIPickerView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var productNamePicker: UIPickerView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet var lblStepperValue: UILabel!
    @IBOutlet var myStepper: UIStepper!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblRemarks: UILabel!
    @IBOutlet weak var txtRemarks: UITextField!
    var productNumber: [String] = ["1", "2", "3", "4", "5"]
    var productName: [String] = ["Cookies", "Headphones", "Macam", "Palmolive", "Loreal Cream"]
    var productImages: [UIImage] = [UIImage(named:"cookies.jpeg")!, UIImage(named:"headphones.jpeg")!, UIImage(named:"Mccam.jpeg")!, UIImage(named:"Pal.jpeg")!, UIImage(named:"loreal.jpeg")!]
    var selectedproductNumberIndex: Int = 0
    var selectedproductNameIndex: Int = 0
//    var selectedproductImageIndex:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.title = "Inventory"
    }
    
    @IBAction func myStepperAction(_ sender: UIStepper) {
        lblStepperValue.text = String(myStepper.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productNumberPicker.delegate = self
        self.productNumberPicker.dataSource = self
        self.productNamePicker.delegate = self
        self.productNamePicker.dataSource = self

    }
    @IBAction func btnSaveAction(_ sender: UIButton) {
        self.savePropertyList()
        let infoAlert = UIAlertController(title: "Saved", message: "Your details are saved successfully", preferredStyle: .alert)
        infoAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnListAction(_ sender: UIButton) {
        let listSB = UIStoryboard(name: "Main", bundle: nil)
        let listVC = listSB.instantiateViewController(withIdentifier: "ProductListScreen")
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func savePropertyList(){
        let myProduct = NSMutableDictionary()
        myProduct["ProductName"] = productName[self.productNamePicker.selectedRow(inComponent: 0)]
        myProduct["ProductNumber"] = productNumber[self.productNumberPicker.selectedRow(inComponent: 0)]
        myProduct["Quantity"] = self.lblStepperValue.text
        myProduct["Remarks"] = self.txtRemarks.text
//        myProduct["ProductImage"] = imgProduct.image
        if let plistPath = Bundle.main.path(forResource: "product", ofType: "plist"){
            let productsplist = NSMutableArray(contentsOfFile: plistPath)
            productsplist?.add(myProduct)
            if (productsplist?.write(toFile: plistPath, atomically: true))!{
                print("productsplist : \(String(describing: productsplist))")
            }
            
        }else{
            print("Unable to locate plist file")
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows: Int = productNumber.count
        if pickerView == productNamePicker{
            countrows = self.productName.count
        }
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == productNumberPicker{
            return productNumber[row]
            
        }else if pickerView == productNamePicker {
            return productName[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 2){
            imgProduct.image = productImages[row]
        }
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
