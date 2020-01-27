//
//  AllCategoryTableViewCell.swift
//  memo
//
//  Created by Tomone Saito on 2019/12/18.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit

class AllCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryTextView : UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
