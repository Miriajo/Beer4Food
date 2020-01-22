//
//  UIViewController+Navigation.swift
//  Beer4Food
//
//  Created by Miriam on 21/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
}
