//
//  UIImageView+Networking.swift
//  Beer4Food
//
//  Created by Miriam on 20/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(fromURL url: URL) {
        
        // it doesn't return anything because it has to be executed in background mode
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    
}
