//
//  CategoryTableViewCell.swift
//  VM
//
//  Created by Aneesh on 11/05/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var icon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.dropShadow()
        cardView.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
