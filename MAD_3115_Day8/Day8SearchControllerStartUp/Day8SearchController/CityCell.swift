//
//  CityTVCell.swift
//  Day8SearchController
//
//  Created by Jigisha Patel on 2018-02-23.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblProvince: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
