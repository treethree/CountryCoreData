//
//  CountryTableViewCell.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
