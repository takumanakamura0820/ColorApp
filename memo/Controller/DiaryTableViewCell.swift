//
//  DiaryTableViewCell.swift
//  memo
//
//  Created by Tomone Saito on 2019/10/30.
//  Copyright © 2019 geeksalon. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
