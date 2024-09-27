//
//  BrandView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 23/09/24.
//

import SwiftUI

struct BrandView: View {
    var brandNames =
    ["Adidas","Balance","CAT","DocGab","Egal"]
    
    @State var isOn = false
    
    var body: some View {
        VStack
        {
            Text("Brands")
                ForEach(brandNames, id: \.self)
                {text in
                    HStack{
                        Toggle(isOn: $isOn) {
                            Text(text)
                        }
                            .foregroundStyle(Color.blue)
                    }
                }
                
            .toggleStyle(.button)
        }
        
    }
}

#Preview {
    BrandView()
}
