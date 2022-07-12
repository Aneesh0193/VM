//
//  ContactListTableViewCell.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import UIKit

class ContactListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupview()
    }
    
    func setupview() {
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        photoImageView.layer.masksToBounds = true
        cardView.dropShadow()
        cardView.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
