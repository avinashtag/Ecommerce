//
//  BrandView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 23/09/24.
//

import SwiftUI

struct BrandView: View {
    var brandNames =
    ["Adidas","Balance","CAT","DocGab","Egal","Fendi","GAP","Hunk","Nike","Zara"]
    
    @State var isOn = false
    
    var body: some View {
        VStack
        {
            Toggle(isOn: $isOn) {
                ForEach(brandNames, id: \.self)
                {text in
                    HStack{
                        Text(text)
                    }
                }
                
            }
            .toggleStyle(.button)
        }
        
    }
}

#Preview {
    BrandView()
}
