//
//  Customer.swift
//  MAD_3115_Day3
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class Customer {
    
    var name: String?
    var email: String?
    var number: Int?
    var password: String?
    var dateOfBirth: String?
    var city: String?
    var postalCode: String?
    
     init(){
        self.name = ""
        self.email = ""
        self.number = 0
        self.password = ""
        self.dateOfBirth = ""
        self.city = ""
        self.postalCode = ""
    }
    
    init(name: String, email: String, number: Int, password: String, dob: String, city: String, postalCode: String){
        self.name = name      
        self.email = email
        self.number = number
        self.password = password
        self.dateOfBirth = dob
        self.city = city
        self.postalCode = postalCode
    }

}
