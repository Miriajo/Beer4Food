//
//  Beer.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation

// MARK: - Beer
struct Beer {
    let id: Int
    let name: String?
    let tagline: String?
    let firstBrewed: Date?
    let description: String?
    let imageURL: URL?
    let foodPairing: [String]?
    let brewersTips: String?

    
    init(id: Int, name: String? = nil, tagline: String? = nil, firstBrewed: Date? = nil, description: String? = nil, imageURL: URL? = nil, foodPairing: [String]? = [], brewersTips: String? = nil) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageURL = imageURL
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
          
      }
}

extension Beer: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
    }

    init(from decoder: Decoder) throws {
           
        let beerContainer = try decoder.container(keyedBy: CodingKeys.self)
                     
        id = try beerContainer.decode(Int.self, forKey: .id)
        
        name = try beerContainer.decodeIfPresent(String.self, forKey: .name)
        tagline = try beerContainer.decodeIfPresent(String.self, forKey: .tagline)
        
        
        let dateFirstBrewed = try beerContainer.decodeIfPresent(String.self, forKey: .firstBrewed)
        firstBrewed = DateFormatter.shortAPIDateFormatter.date(from: dateFirstBrewed!)
                
        description = try beerContainer.decodeIfPresent(String.self, forKey: .description)
        
        imageURL = try beerContainer.decodeIfPresent(URL.self, forKey: .imageURL)
        
        foodPairing = try beerContainer.decodeIfPresent([String].self, forKey: .foodPairing)
        brewersTips = try beerContainer.decodeIfPresent(String.self, forKey: .brewersTips)
                   
    }
       
}
