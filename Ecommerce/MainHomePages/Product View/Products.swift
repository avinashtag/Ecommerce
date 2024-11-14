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
            
            DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                NotificationCenter.default.post(name: NSNotification.Name("SuccessLoadAllProducts"), object: nil)
            }
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
class ProductItem: Hashable, Codable{
    
    let id: Int
    let title: String
    let price: Double
    let explaination: String
    let category: Products.Category
    let image: String
    let rating: Products.Rating
    
    var quantity: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case explaination = "description"
        case category
        case image
        case rating
        case quantity
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: ProductItem.CodingKeys.self)
        try container.encode(self.id, forKey: ProductItem.CodingKeys.id)
        try container.encode(self.title, forKey: ProductItem.CodingKeys.title)
        try container.encode(self.price, forKey: ProductItem.CodingKeys.price)
        try container.encode(self.explaination, forKey: ProductItem.CodingKeys.explaination)
        try container.encode(self.category, forKey: ProductItem.CodingKeys.category)
        try container.encode(self.image, forKey: ProductItem.CodingKeys.image)
        try container.encode(self.rating, forKey: ProductItem.CodingKeys.rating)
        try container.encodeIfPresent(self.quantity, forKey: ProductItem.CodingKeys.quantity)
    }

    
    required init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<ProductItem.CodingKeys> = try decoder.container(keyedBy: ProductItem.CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: ProductItem.CodingKeys.id)
        self.title = try container.decode(String.self, forKey: ProductItem.CodingKeys.title)
        self.price = try container.decode(Double.self, forKey: ProductItem.CodingKeys.price)
        self.explaination = try container.decode(String.self, forKey: ProductItem.CodingKeys.explaination)
        self.category = try container.decode(Products.Category.self, forKey: ProductItem.CodingKeys.category)
        self.image = try container.decode(String.self, forKey: ProductItem.CodingKeys.image)
        self.rating = try container.decode(Products.Rating.self, forKey: ProductItem.CodingKeys.rating)
        self.quantity = try container.decodeIfPresent(Int.self, forKey: ProductItem.CodingKeys.quantity)
    }    


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
