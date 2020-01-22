//
//  BeerTableViewCell.swift
//  Beer4Food
//
//  Created by Miriam on 22/01/2020.
//  Copyright © 2020 Miriam. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerTips: UILabel!
    
    static let nibName = "BeerTableViewCell"
    static let cellIdentifier = "BeerTableViewCellReuseIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
}
