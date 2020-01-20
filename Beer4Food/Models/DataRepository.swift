//
//  DataRepository.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import Foundation


class DataRepository {
    
    static let shared: DataRepository = DataRepository()
    
    let beersProvider: BeerPunkAPIConsumerAlamofire
    
    private init() {
        beersProvider = BeerPunkAPIConsumerAlamofire()
    }
    
}
