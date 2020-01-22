//
//  BeerItemAPIConsumable.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation


protocol BeerItemAPIConsumable {

    // get all Beers matching with Food Search
    func getSearchBeerItems(byFood foodSearch: String, page: Int, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void)

    // get Beer by Id for detail
    func getBeerItem(byId beerId: Int, success: @escaping (Beer) -> Void, failure: @escaping (Error?) -> Void)

}
