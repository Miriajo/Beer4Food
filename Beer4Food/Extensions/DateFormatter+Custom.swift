//
//  DateFormatter+Custom.swift
//  Beer4Food
//
//  Created by Miriam on 20/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation

extension DateFormatter {

    // Static constant of class - Computed property
    static let shortAPIDateFormatter: DateFormatter = {
        // Assing a closure returning a format
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yyyy"
        return formatter
    }() // parenthesis at the end are to execute

    static let longAPIDateFormatter: DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
