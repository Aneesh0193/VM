//
//  CategoryViewController.swift
//  Demo
//
//  Created by Aneesh on 11/05/22.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var categoryTableview: UITableView!

    //MARK: - Variables
    private var categoryList = [String]()
    private var imageIconArray = [String]()
    
    //MARK: - Viewlife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupview()
    }
    
    //MARK: - setupview
    private func setupview() {
        self.title = "Category"
        categoryList = ["Contact Details","Available Rooms"]
        imageIconArray = [ImageAsset.contact.rawValue,ImageAsset.room.rawValue]
        self.categoryTableview.backgroundColor = .systemGray6
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCategoryCellIdentifier) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.categoryLabel?.text = categoryList[indexPath.row]
        cell.icon.image = UIImage(named: imageIconArray[indexPath.row]) 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let contactViewcontroller = ContactDetailsViewController.instantiate(fromAppStoryboard: .main)
            self.navigationController?.pushViewController(contactViewcontroller, animated: true)
        case 1:
            
            let roomsAvailabilityViewcontroller = RoomsAvailabeViewController.instantiate(fromAppStoryboard: .main)
            self.navigationController?.pushViewController(roomsAvailabilityViewcontroller, animated: true)
        default:
            break
        }
    }
}
