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
            .frame(width: 500,height: 200)
    }
}

#Preview {
    ProductBannerView()
}
