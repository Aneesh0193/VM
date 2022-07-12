//
//  ContactViewModel.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import Foundation

final class ContactViewModel {

    private var contactResponse = Contacts()
    private let apiServiceProtocol: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiServiceProtocol = apiService
    }
    
    func getContactListData(completion: @escaping ServiceCallback) {
        guard let url = URL(string: APIPath().contactDetails) else {
            return
        }
         
        apiServiceProtocol.getAPIData(requestUrl: url, resultType: Contacts.self) { success, data, error in
            guard let response = data else {
                return completion(false, nil, error)
            }
            
            if let contactList = response as? Contacts {
                self.contactResponse = contactList
            }
            completion(success, response, error)
        }
    }
    
    func getNumberOfRowsInSections() -> Int {
        return contactResponse.count
    }
    
    func getData(index: Int) -> ContactList? {
        return self.contactResponse[index]
    }
    
    func getProfileImage(index: Int) -> Data {
        let model = contactResponse[index]
        let imageUrl = URL(string: model.avatar ?? "") ?? URL(fileURLWithPath: "")
        
        if let data = try? Data(contentsOf: imageUrl) {
           return data
        }
        return Data()
    }
}
