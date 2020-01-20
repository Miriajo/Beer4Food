//
//  BeerPunkAPIConsumerAlamofire.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation
import Alamofire

class BeerPunkAPIConsumerAlamofire: BeerItemAPIConsumable {
    

    func getSearchBeerItems(byFood foodSearch: String, success: @escaping ([Beer]) -> Void, failure: @escaping (Error?) -> Void) {
          
          Alamofire.request(PunkAPIConstants.getSearchByFoodURL(withQueryParam: foodSearch)).responseData { (response) in
              switch response.result {
              case .failure(let error):
                assert(Thread.current == Thread.main)
                failure(error)
              case .success(let value):
                assert(Thread.current == Thread.main)
                do {
                  let decoder = JSONDecoder()
                  let beerCollection = try decoder.decode([Beer].self, from: value)
                    success(beerCollection)
                } catch {
                  failure(error)
                }
                 
              }
          }
          
      }
    
      
      func getBeerItem(byId beerId: Int, success: @escaping (Beer) -> Void, failure: @escaping (Error?) -> Void) {
          
          Alamofire.request(PunkAPIConstants.urlForBeer(withId: beerId)).responseData { (response) in
              
              switch response.result {
              case .failure(let error):
                assert(Thread.current == Thread.main)
                failure(error)
              case .success(let value):
                assert(Thread.current == Thread.main)
                do {
                    let decoder = JSONDecoder()
                    let beer = try decoder.decode([Beer].self, from: value)
                    success(beer[0])
                } catch {
                  failure(error)
                }
                  
              }
          }
          
      }
    
    
    
}
