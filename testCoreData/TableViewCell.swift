//
//  TableViewCell.swift
//  testCoreData
//
//  Created by d0m on 24/10/2018.
//  Copyright © 2018 d0m. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
