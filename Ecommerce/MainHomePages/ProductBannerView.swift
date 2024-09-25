//
//  ProductBannerView.swift
//  Ecommerce
//
//  Created by Avinash on 24/09/2024.
//

import SwiftUI

struct ProductBannerView: View {
    var body: some View {
        Image("FashonSale")
            .resizable()
            .scaledToFit()
            .frame(width: 200,height: 200)
        //Frame suppose to be by uiscreen bound relative
        //Height make it 16:9 ratio
    }
}
/*
 
 Make it center image
 try pass first product and show image
 
 Create Product Detail page
 
 Optional
 - connect
 - show detail
 
 */
#Preview {
    ProductBannerView()
}
