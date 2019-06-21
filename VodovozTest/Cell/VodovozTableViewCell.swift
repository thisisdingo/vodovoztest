//
//  VodovozTableViewCell.swift
//  VodovozTest
//
//  Created by Mister Gamburger on 21/06/2019.
//  Copyright © 2019 Mister Gamburger. All rights reserved.
//

import UIKit

class VodovozTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var countField : UITextField!
    @IBOutlet weak var priceField : UILabel!
    @IBOutlet weak var discountPercent : UIButton!
    @IBOutlet weak var totalCount : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProduct(_ product : ProductModel){
        
        self.titleLabel.text = product.name
        self.countField.text = String(product.count)
        self.priceField.text = String(product.price)
        self.discountPercent.setTitle(String(product.discountPercent), for: .normal)
        self.totalCount.text = String(product.totalSum)
    }
    
    
    
}
