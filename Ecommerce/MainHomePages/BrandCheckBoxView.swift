//
//  BrandCheckBoxView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 24/09/24.
//

import SwiftUI

struct BrandCheckBoxView: View {
    
    @State var categories : [Products.Category] = [.electronics, .jewelery, .menSClothing, .womenSClothing]

    @Binding var selectedCategory : [Products.Category]
    @Binding var isSelectedFilter : Bool

    var didFinishFilter: (()->Void)
    
    var body: some View {
        
        VStack(alignment:.trailing)
        {
            Text("Brand's")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            ForEach($categories, id: \.self) { brand in
                
                ModelBrand( category: brand, selectedCategory: $selectedCategory)
                    .padding(5)
            }
            
            Button(action: {
                isSelectedFilter.toggle()
                didFinishFilter()
            }, label: {
                Text("Done")
                    .buttonStyle(ConfirmButton())
            })
        }
    }
}

//#Preview {
//    BrandCheckBoxView()
//}

struct ModelBrand:View {
    
    @State  var isSelected: Bool = false
    @Binding var category : Products.Category
    @Binding var selectedCategory : [Products.Category]

    var body: some View {
        Button{
            isSelected.toggle()
            if isSelected {
                selectedCategory.append(category)
            }
            else{
                selectedCategory.removeAll(where: {$0 == category})
            }
            
        }label: {
            Text(category.rawValue)
                .font(.title2)
                .foregroundStyle(.green)
            Image(systemName: isSelected ? "checkmark.square":"square")
                .foregroundColor(isSelected ? .indigo : .red)
                .font(.title2)
        }
    }
}

