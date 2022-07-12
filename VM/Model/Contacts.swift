//
//  Contacts.swift
//
//  Created by Aneesh on 11/05/22.
//

import Foundation

typealias Contacts = [ContactList]

// MARK: - ContactList
struct ContactList: Codable {
    let createdAt: String?
    let firstName: String?
    let avatar: String?
    let lastName: String?
    let email: String?
    let jobtitle: String?
    let favouriteColor: String?
    let id: String?
}

 
 

