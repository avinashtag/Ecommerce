//
//  SharedEcommerce.swift
//  Ecommerce
//
//  Created by Avinash on 14/10/2024.
//

import Foundation

// singleton
// Will give memory once in application cycle


class SharedEcommerce{
    
    static let shared: SharedEcommerce = SharedEcommerce()
    
    
//    var cartProducts: [Products.Product] = []
    var cartProducts: Set<ProductItem> = Set()
    
}
