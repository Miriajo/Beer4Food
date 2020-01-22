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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var state: ViewControllerState = .ready {
        willSet {
            guard state != newValue else { return }
            
            [listTableView, activityIndicator].forEach { (view) in
                view?.isHidden = true
            }
            
            switch newValue {
            case .loading:
                activityIndicator.isHidden = false
            case .ready:
                listTableView.isHidden = false
                listTableView.reloadData()
            }
        }
    }
    
    var beerList: [Beer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.state = .loading
        
        getBeers(searchText: searchBar.searchTextField.text!)
                
        configView()
      
    }

    func configView() {
        
        
        
        listTableView.register(UINib(nibName: BeerTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: BeerTableViewCell.cellIdentifier)
      
        self.listTableView.rowHeight = UITableView.automaticDimension
        self.listTableView.estimatedRowHeight = 80
        self.listTableView.separatorStyle = .none
      
        listTableView.dataSource = self
        listTableView.delegate = self
        
        searchBar.delegate = self
    }
   
    func showBeers() {
        self.state = .ready
        self.listTableView.reloadData()
    }
    

    func getBeers(searchText: String) {
        
        //let searchText = "lamb"

        let apiConsumer = DataRepository.shared.beersProvider
        
        apiConsumer.getSearchBeerItems(byFood: searchText, page: 1, success: { (beerCollection) in
            
            self.beerList = beerCollection
            self.state = .ready
            self.listTableView.reloadData()
             
       }) { (error) in
           
         let alert = UIAlertController(title: "Texto Incorrecto", message: "Por favor, introduce un texto válido.", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
         NSLog("The \"OK\" alert occured.")}))
       }
        
    }
    
    
}



extension SearchViewController: UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let beer = beerList[indexPath.row]
        
      /* let cellId = "BeerCell"
        var beerCell = listTableView.dequeueReusableCell(withIdentifier: cellId)
        if beerCell == nil {
            beerCell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
 */
        let beerCell = listTableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.cellIdentifier) as! BeerTableViewCell
        
        beerCell.beerName.text = beer.name
        beerCell.beerTips.text = beer.description
        
        return beerCell
        
    }
        
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let beerSelected = beerList[indexPath.row]
        
        navigationController?.pushViewController(DetailViewController(beerItem: beerSelected), animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getBeers(searchText: searchText)
    }
    
}
