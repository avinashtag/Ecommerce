//
//  BrandCheckBoxView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 24/09/24.
//

import SwiftUI

struct BrandCheckBoxView: View {
    
    @State private var products : [Products.Product] = []
    @State private var product : Products.Category?
    @State var productsForYou: String = "Products For You"
    
    var brandNames =
    ["Adidas","Balance","CAT","DocGab","Egal","Fendi","GAP","Hunk","Nike","Zara"]
    
    @State var brandState:[String:Bool] =
    ["Adidas": false,
     "Balance": false,
     "CAT": false,
     "DocGab": false,
     "Egal": false,
     "Fendi": false,
     "GAP": false,
     "Hunk": false,
     "Nike": false,
     "Zara": false
    ]
    
    var body: some View {
        
        VStack(alignment:.trailing)
        {
            Text("Brand's")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            
            
            //            ForEach(brandNames)
            
            //            ModelBrand(isSelected: brandState["Adidas"] ?? false, brandName: "Adidas")
            
            ForEach(brandState.keys.sorted(), id: \.self)
            {
                brand in
                ModelBrand(isSelected: brandState[brand]!, brandName: brand)
                    .padding(5)
            }
            
//            Text(product)
//            ProductBannerView(product: $product)
//            ModelBrand(isSelected: true, brandName: product?)
        }
        .task {
            
            do{
                products = try await Products.Request().load()
                guard products.count > 0 else { return }
//                (where: products.last)
//                == "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5"})
                
//                products.filter({$0.category == .menSClothing})
//                products.filter({$0.title == ""})
            }
            catch{
                print(error)
            }
        }
    }
}

#Preview {
    BrandCheckBoxView()
}

struct ModelBrand:View {
    
    @State  var isSelected: Bool
   
//    @State
    var brandName:String
    
    var body: some View {
        Button{
            isSelected.toggle()
        }label: {
            Text(brandName)
                .font(.title2)
                .foregroundStyle(.green)
            Image(systemName: isSelected ? "checkmark.square":"square")
                .foregroundColor(isSelected ? .indigo : .red)
                .font(.title2)
        }
    }
}

