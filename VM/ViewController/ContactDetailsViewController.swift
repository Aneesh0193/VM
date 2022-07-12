//
//  ContactDetailsViewController.swift
//  Demo
//
//  Created by Aneesh on 11/05/22.
//

import UIKit

final class ContactDetailsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var contactTableView: UITableView!
    
    //MARK: - Variables
    private var contactViewModel: ContactViewModel? = nil
    private let apiService = HttpUtility()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getContactDetails()
    }
    
    //MARK: - SetupView
    private func setupView() {
        self.title = kContacts
        contactTableView.estimatedRowHeight = 400
        contactTableView.rowHeight = UITableView.automaticDimension
        
        contactViewModel = ContactViewModel(apiService: apiService)
    }
    
    //MARK: - Get Contact Details
   private func getContactDetails() {
       contactViewModel?.getContactListData { [weak self] success, response, error in
            guard let self = self else {return}
           success ? self.refreshTableView() : ()
        }
    }
    
    //MARK: - Refresh TableView
    private func refreshTableView() {
        self.contactTableView.delegate = self
        self.contactTableView.dataSource = self
        self.contactTableView.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ContactDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactViewModel?.getNumberOfRowsInSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kContactCellIdentifier) as? ContactListTableViewCell else {
            return UITableViewCell()
        }
        guard let model = contactViewModel?.getData(index: indexPath.row) else { return cell }
        
        cell.nameLabel.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        cell.jobTitleLabel.text = model.jobtitle
        cell.photoImageView.image = UIImage(data: contactViewModel?.getProfileImage(index: indexPath.row) ?? Data())
        cell.emailIdLabel.text = model.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        let detailedViewcontroller = UserDetailedViewController.instantiate(fromAppStoryboard: .main)
        detailedViewcontroller.selectedUserData = self.contactViewModel?.getData(index: indexPath.row)
        self.navigationController?.pushViewController(detailedViewcontroller, animated: true)
    }
}
     
       
