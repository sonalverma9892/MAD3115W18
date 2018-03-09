//
//  InventoryTVCell.swift
//  Sonal_C0726246_MAD3115_MT
//
//  Created by MacStudent on 2018-03-09.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit

class InventoryTVCell: UITableViewCell {
    
    @IBOutlet var txtProductNo: UITextField!
    @IBOutlet var txtProductName: UITextField!
    @IBOutlet var txtQuantity: UITextField!
    @IBOutlet var txtRemark: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
