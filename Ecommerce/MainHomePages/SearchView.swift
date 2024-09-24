//
//  SearchView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 21/09/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var search:String
    
    var body: some View {
        HStack
        {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
            TextField("Search",text: $search)
                .padding()
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundColor(.black)
        }
        .padding()
        .frame(width: 320,height: 50)
//        .frame(maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .foregroundColor(.white)
        
    }
    
}

#Preview {
    SearchView(search: "")
}




