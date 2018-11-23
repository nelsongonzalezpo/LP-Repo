//
//  ViewControllerTableViewCell.swift
//  LP-Exercise
//
//  Created by Nelson Gonzalez on 11/22/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
