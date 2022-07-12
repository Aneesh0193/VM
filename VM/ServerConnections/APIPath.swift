 

import Foundation

let environment = APIEnvironment.development
let baseURL = environment.baseURL()

struct APIPath {
    var contactDetails: String { return "\(baseURL)people"}
    var roomsAvailability: String { return "\(baseURL)rooms"}
}

