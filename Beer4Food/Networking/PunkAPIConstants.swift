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
    
    static func getSearchByFoodURL(withQueryParam queryParam: String) -> URL {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [URLQueryItem(name: "food", value: queryParam)]
        
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
