//
//  RoomsTableViewCell.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var occupiedStatusLabel: UILabel!
    @IBOutlet weak var maximumOccupancyLabel: UILabel!
    @IBOutlet weak var roomNumberLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 10.0
        cardView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
