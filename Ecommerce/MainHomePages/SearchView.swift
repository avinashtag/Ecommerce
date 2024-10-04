//
//  SearchView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 21/09/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var search:String
    @State private var isPresentFilters :Bool = false
    @Binding var selectedCategory : [Products.Category]
    @Binding var isSelectedFilter : Bool
    var didFinishFilter: (()->Void)

    var body: some View {
        
        HStack
        {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
            TextField("Search",text: $search)
                .padding()
            
            Button(action: {
                isPresentFilters.toggle()
            }, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(.black)
            })
        }
        .padding()
        .frame(width: 320,height: 50)
        .background(Color.white)
        .cornerRadius(30)
        .foregroundColor(Color.blue)
        .sheet(isPresented: $isPresentFilters, content: {
            BrandCheckBoxView( selectedCategory: $selectedCategory, isSelectedFilter: $isSelectedFilter, didFinishFilter:{
                didFinishFilter()
            })
        })
        
    }
    
}

//#Preview {
//    SearchView(search: "")
//}
