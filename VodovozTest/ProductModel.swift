//
//  ProductModel.swift
//  VodovozTest
//
//  Created by Mister Gamburger on 21/06/2019.
//  Copyright © 2019 Mister Gamburger. All rights reserved.
//

import Foundation


struct ProductModel {
    
    var id : Int
    var name : String
    var count : Int
    var price : Int
    var discountPercent : Int
    
    var totalSum : Float {
        let discount = (Float(price) * Float(count)) * (Float(discountPercent) / 100)
        
        return (Float(price) * Float(count)) - discount
    }
    
}
