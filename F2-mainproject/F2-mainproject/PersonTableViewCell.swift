//
//  PersonTableViewCell.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/19/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
