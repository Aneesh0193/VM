//
//  UserDetailedViewController.swift
//  VM
//
//  Created by Raj 2 on 11/07/2022.
//

import UIKit

class UserDetailedViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var selectedUserData: ContactList?
    private let kTitle = "Profile"

    override func viewDidLoad() {
        super.viewDidLoad() 
        setupView()
    }
    
    func setupView() {
        self.profile.layer.cornerRadius = profile.frame.width / 2 
        
        self.title = kTitle
        name.text = "\(selectedUserData?.firstName ?? "") \(selectedUserData?.lastName ?? "")"
        jobTitle.text = selectedUserData?.jobtitle
        email.text = selectedUserData?.email
        profile.image =  getImage(image: selectedUserData?.avatar ?? "")
       // backgroundView.backgroundColor = UIColor.
    }
    
    func getImage(image: String) -> UIImage{
        guard let imageUrl = URL(string: image) else { return UIImage()}
        
        if let data = try? Data(contentsOf: imageUrl) {
            let image = UIImage(data: data) ?? UIImage()
           return image
        }
        
        return UIImage()
    }
}
