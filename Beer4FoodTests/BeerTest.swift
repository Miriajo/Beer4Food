//
//  BeerTest.swift
//  Beer4FoodTests
//
//  Created by Miriam on 22/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import XCTest

class BeerTest: XCTestCase {

    let decoder = JSONDecoder()
       
    var beerTestData: Beer!
       
    override func setUp() {
       super.setUp()

        let date = DateFormatter.shortAPIDateFormatter.date(from: "07/2012")
                
        beerTestData = Beer(id: 7,
                            name: "AB:12",
                            tagline: "Imperial Black Belgian Ale.",
                            firstBrewed: date,
                            description: "An Imperial Black Belgian Ale aged in old Invergordon Scotch whisky barrels with mountains of raspberries, tayberries and blackberries in each cask. Decadent but light and dry, this beer would make a fantastic base for ageing on pretty much any dark fruit - we used raspberries, tayberries and blackberries beause they were local.",
                            imageURL: URL(fileURLWithPath: "https://images.punkapi.com/v2/7.png"),
                            foodPairing: ["Tandoori lamb with pomegranate","Beef Wellington with a red wine jus","Raspberry chocolate torte"],
                            brewersTips: "Don't worry too much about controlling the temperature with the Belgian yeast strain - just make sure it doesn't rise above 30°C!")
              
    }

    func testUserExistence() {
       XCTAssertNotNil(beerTestData)
    }
       
       
     
       
    func testDecodeEncodeUser() {

        guard let path = Bundle(for: type(of: self)).path(forResource: "beerMock", ofType: "json") else {
            XCTFail()
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            
            let beer = try decoder.decode([Beer].self, from: data)
            
            XCTAssertNotNil(beer)
            XCTAssertNotNil(beer[0].id)
            XCTAssertNotNil(beer[0].name)
            XCTAssertNotNil(beer[0].tagline)
            XCTAssertNotNil(beer[0].firstBrewed)
            XCTAssertNotNil(beer[0].description)
            XCTAssertNotNil(beer[0].imageURL)
            XCTAssertNotNil(beer[0].foodPairing)
            XCTAssertNotNil(beer[0].brewersTips)
        } catch {
           XCTFail()
        }
    }


}
