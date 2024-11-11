//
//  Products.swift
//  EcommerceCart
//
//  Created by Avinash on 17/09/2024.
//

import Foundation
import SwiftData


public enum Products{
    
    struct Request : Codable{
        
        
        
        //Load form API do not use
        public func loadFromAPI() async throws -> [Product]{
            
            guard let url = URL(string: "https://fakestoreapi.com/products") else { throw ErrorResponse.requestFailed }
            var request = URLRequest(url:  url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode([Product].self, from: data)
            return result
        }
        
        
        //Load form bundle do not use
        public func loadFromBundle() async throws -> [Product]{
            
            guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else { throw ErrorResponse.requestFailed }
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode([Product].self, from: data)
            return result
        }
         
        
        public func load() async throws -> [Product]{
            return try Bundle.main.decoder("Products.json", of: [Product].self)
//            let response: [Product] = try await Network.shared.fetch(for: .products)
//            return response
        }
    }
    
    //codable
    // Decode response api
    //encode to send request to API
    
    struct Product: Codable, Hashable {
        static func == (lhs: Products.Product, rhs: Products.Product) -> Bool {
            lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        let id: Int
        let title: String
        let price: Double
        let description: String
        let category: Category
        let image: String
        let rating: Rating
        
        var quantity: Int?
        
      
    }

    enum Category: String, Codable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
    }

    // MARK: - Rating
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }

}

@Model
class ProductItem: Hashable{
    
    let id: Int
    let title: String
    let price: Double
    let explaination: String
    let category: Products.Category
    let image: String
    let rating: Products.Rating
    
    var quantity: Int?
    
    init(id: Int, title: String, price: Double, explaination: String, category: Products.Category, image: String, rating: Products.Rating, quantity: Int? = nil) {
        self.id = id
        self.title = title
        self.price = price
        self.explaination = explaination
        self.category = category
        self.image = image
        self.rating = rating
        self.quantity = quantity
    }
        
    convenience init( product: Products.Product) {
        self.init(id: product.id, title: product.title, price: product.price, explaination: product.description, category: product.category, image: product.image, rating: product.rating, quantity: product.quantity)
    }
    
//    func parse(_ product: Products.Product)->ProductItem {
//        return ProductItem(id: product.id, title: product.title, price: product.price, explaination: product.description, category: product.category, image: product.image, rating: product.rating, quantity: product.quantity)
//    }

    
    
    
}
