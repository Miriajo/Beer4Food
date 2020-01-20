//
//  SearchViewController.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import UIKit

enum ViewControllerState {
    case loading
    case ready
}


class SearchViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getBeersFoodMock()
        //getBeerMock()
        self.reloadInputViews()
    }


    func getBeersFoodMock() {
        
        let searchFood = "lamb"

        let apiConsumer = DataRepository.shared.beersProvider
        
        apiConsumer.getSearchBeerItems(byFood: searchFood, success: { (beerCollection) in
            
            if (beerCollection.count != 0) {
                
                print("beerCollection success: ", beerCollection.count)
                print("beerCollection 1: ", beerCollection[0])
            }
            
       }) { (error) in
           
         let alert = UIAlertController(title: "Texto Incorrecto", message: "Por favor, introduce un texto válido.", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
         NSLog("The \"OK\" alert occured.")}))
       }
        
    }
    
    func getBeerMock() {
           
           let searchID = 7

           let apiConsumer = DataRepository.shared.beersProvider
           
           apiConsumer.getBeerItem(byId: searchID, success: { (beer) in
               
               if (beer != nil) {
                   
                   print("beerCollection success: ", beer)
               }
               
          }) { (error) in
              
            let alert = UIAlertController(title: "Texto Incorrecto", message: "Por favor, introduce un texto válido.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")}))
          }
           
       }
    
}
