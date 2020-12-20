//
//  StreaksTableViewCell.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit

class StreaksTableViewCell: UITableViewCell {
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var habitName: UILabel!
    @IBOutlet weak var friendStreak: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
