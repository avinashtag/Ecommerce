//
//  Bundle+Extension.swift
//  Ecommerce
//
//  Created by Avinash on 25/09/2024.
//

import Foundation

extension Bundle{
   
    
    func decoder<T:Decodable>(_ filename: String, of type: T.Type )throws  -> T {
      
        guard let url = self.url(forResource: filename, withExtension: nil) else { throw ErrorResponse.endpointInvalid }
        
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        jsonDecoder.dateDecodingStrategy = .formatted(formatter)
        let decodable = try jsonDecoder.decode(T.self, from: data)

        return decodable
    }

}


//extension String{
//    
//    func appendMyName()->String{
//        return "Avinash \(self)"
//    }
//}
