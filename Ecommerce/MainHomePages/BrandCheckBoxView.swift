//
//  BrandCheckBoxView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 24/09/24.
//

import SwiftUI

struct BrandCheckBoxView: View {
    
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
        }
    }
}

#Preview {
    BrandCheckBoxView()
}

struct ModelBrand:View {
    
    @State  var isSelected: Bool
   
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
