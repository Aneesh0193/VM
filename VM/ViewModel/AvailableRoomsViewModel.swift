//
//  AvailableRoomsViewModel.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import Foundation

enum Room: String {
    case available = "Available"
    case notAvailable = "Not Available"
}


final class AvailableRoomsViewModel {
     
    var roomsResponse = [RoomsList]()
    let apiServiceProtocol: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiServiceProtocol = apiService
    }
    
 

    func getRoomsList(completion: @escaping ServiceCallback) {
        guard let url = URL(string: APIPath().roomsAvailability) else {
            return
        }
        
        apiServiceProtocol.getAPIData(requestUrl: url, resultType: Rooms.self) { success, data, error in
            guard let response = data else {
                return completion(false, nil, error)
            }
            
            if let roomsList = response as? [RoomsList] {
                self.roomsResponse = roomsList
            }
            completion(success, response, error)
        }
    }
    
    func getNumberOfRowsInSections() -> Int {
        return roomsResponse.count
    }
    
    func getData(index: Int) -> RoomsList? {
        return self.roomsResponse[index]
    }
    
    func getRoomsAvailability(index: Int) -> String {
        if roomsResponse[index].isOccupied ?? Bool() {
            return Room.notAvailable.rawValue
        }
        
        return Room.available.rawValue
    }
}

//class MockData: appDependencyModelService {
//    func getAPIData<T>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping (ServiceCallback)) where T : Decodable {
//        
//    }
//    
//    func getRoomsAvailability(index: Int) -> String {
//         
//        return Room.available.rawValue
//    }
//}

