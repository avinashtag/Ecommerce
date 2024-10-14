//
//  CartView.swift
//  Ecommerce
//
//  Created by Avinash on 14/10/2024.
//

import SwiftUI



struct CartView: View {
    
    
    @State var products: [Products.Product] = SharedEcommerce.shared.cartProducts

    var body: some View {
        List {
            Section("Products to buy") {
                if products.count == 0{
                    VStack(alignment: .center, content: {
                        Text("No product added to the cart yet.")
                    })
                }
                else{
                    ForEach(products, id: \.self){ product in
                        
                        HStack(alignment: .top, content: {
                            AsyncImage(url: URL(string: product.image), scale: 1) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100,alignment: .center)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                            .frame(width: 100, height: 100)
                            
                            Text(product.title)
                                .font(.body)
                            Spacer()
                            Text("$\(product.price , specifier: "%.2f")")
                                .font(.body.bold())
                        })
                        
                    }
                }
            }
        }
        .task {
                products = SharedEcommerce.shared.cartProducts
        }
        .refreshable {
            products = SharedEcommerce.shared.cartProducts
        }

    }
}

#Preview {
    
    CartView()
}

