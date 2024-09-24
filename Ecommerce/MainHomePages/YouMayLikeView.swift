//
//  YouMayLikeView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 22/09/24.
//

import SwiftUI

struct YouMayLikeView: View {
    
    var likeSet =
    [
        "FossilWatch",
        "MenFootWare",
        "MenWare",
        "WomenWare"
    ]
    var likeSetNames =
    [
        "FossilWatch",
        "Sneakers",
        "Cargo",
        "Saree"
    ]
    
    var body: some View {
        VStack
        {
            Text("You May Like")
                .font(.title2)
                .bold()
        }
        
            ScrollView(.horizontal)
            {
                HStack
                {
                    ForEach(Array(zip(likeSet, likeSetNames)), id: \.0) { image, name in
                        VStack
                        {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                            Text(name)
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }.padding()
            }.background(.green)
        
        
    }
}



#Preview {
    YouMayLikeView()
}
