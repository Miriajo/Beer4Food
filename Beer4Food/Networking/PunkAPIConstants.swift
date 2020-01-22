//
//  PunkAPIConstants.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation

private let scheme = "https"
private let host = "api.punkapi.com"
private var path = "/v2/beers"


struct PunkAPIConstants {
    
    static func getSearchByFoodURL(withQueryParam queryParam: String, page: Int) -> URL {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let pageSizeQueryItem = URLQueryItem(name: "per_page", value: "50")
        
        if (queryParam != "") {
            let foodSearchQueryItem = URLQueryItem(name: "food", value: queryParam)
            components.queryItems = [pageQueryItem, pageSizeQueryItem, foodSearchQueryItem]
        } else {
            components.queryItems = [pageQueryItem, pageSizeQueryItem]
        }
            
        return components.url!
    }
    
    static func urlForBeer(withId beerId: Int) -> URL {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path + "/\(beerId)"
        
        return components.url!
    }
    
}
