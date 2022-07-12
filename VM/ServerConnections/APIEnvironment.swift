
 
import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
  
    func baseURL () -> String {
        return "https://\(domain())\(subdomain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return kBaseUrl
        case .staging:
            return kBaseUrl
        case .production:
            return kBaseUrl
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api/v1/"
        }
    }
}

