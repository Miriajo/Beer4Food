//
//  DetailViewController.swift
//  Beer4Food
//
//  Created by Miriam on 17/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var firstBrewed: UILabel!
    @IBOutlet weak var beerDescription: UITextView!
    @IBOutlet weak var beerImg: UIImageView!
    @IBOutlet weak var foodPairing: UITextView!
    @IBOutlet weak var brewesTips: UITextView!
    
    
    var beerItem: Beer
    
    init(beerItem: Beer) {
        self.beerItem = beerItem
        
        super.init(nibName: nil, bundle: nil)
        title = beerItem.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncDataWithView()
     }
    
    func syncDataWithView() {
        
        title = beerItem.name
        
        tagline.text = beerItem.tagline
        
        let date1stBrewed = DateFormatter.shortAPIDateFormatter.string(from: beerItem.firstBrewed!)
        
        firstBrewed.text = "First Brewed: \(date1stBrewed)"
        beerDescription.text = beerItem.description
        
        if let url = beerItem.imageURL {
            beerImg.loadImage(fromURL: url)
        }
        
        var pairingText: String = ""
        
        for pairing in beerItem.foodPairing! {
            pairingText += "- " + pairing + "\n"
        }
        foodPairing.text = pairingText
                
        brewesTips.text = beerItem.brewersTips
        
    }


   
   /* func getBeerMock() {
           
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
    
    */
}


