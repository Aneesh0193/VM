//
//  UIView+Extension.swift
//  VM
//
//  Created by Aneesh on 12/05/22.
//

import UIKit


//MARK:- UIView
extension UIView {
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        layer.shadowOpacity = 3.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
    }
    
    func cardViewShadow(){ 
        layer.cornerRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 2)
        layer.shadowRadius = 8.0
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
