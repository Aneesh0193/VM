//
//  UIViewController+Extension.swift
//  VM
//
//  Created by Aneesh on 11/05/22.
//

import Foundation
import UIKit


extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }

    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
        

