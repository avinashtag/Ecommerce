//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 06/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: Products.Product?
    @Binding var navigationPath : NavigationPath

    var body: some View {
        VStack
        {
            
            AsyncImage(url: URL(string: product?.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }

            Text(product?.title ?? "")
                .font(.title2)
                .bold()
            Text("₹ \(product?.price ?? 0)")
                .font(.title3)
                .bold()
                .foregroundStyle(Color.blue)
            Divider()
            Text("Details")
                .font(.title3)
                .underline()
                .bold()
            Text(product?.description ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
            Divider()
            
            Button(action: {
                navigationPath.append("Cart")
            },
                   label: {
                Text("Buy Now")
                    .font(.title3)
                    .bold()
            })
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
            
            Button(action: {
                guard let product = product else { return }
                //check for the existing product
                if SharedEcommerce.shared.cartProducts.contains(where: {$0.id == product.id}) == false {
                    SharedEcommerce.shared.cartProducts.append(product)
                }
            },
                   label: {
                Text("Add To Cart")
                    .font(.title3)
                    .bold()
            }
                )
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(30)
            
        }
        .navigationDestination(for: String.self) { _ in
            CartView()
        }
    }
}

#Preview {
    ProductDetailView(product: Binding(get: {
        let products = try? Bundle.main.decoder("Products.json", of: [Products.Product].self)
        return products?[1]
    }, set: { _ in
        
    }), navigationPath: Binding(get: {NavigationPath()}, set: {_ in }))
}


//singleton
//next session
//Environment
// Database - SwiftData

// set try
// quantity in views cart and detail
