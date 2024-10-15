//
//  CartView.swift
//  Ecommerce
//
//  Created by Avinash on 14/10/2024.
//

import SwiftUI



struct CartView: View {
    
    
    @State var products = SharedEcommerce.shared.cartProducts
    

    var body: some View {
        List {
            Section("Products to buy") {
                if products.count == 0{
                    VStack(alignment: .center, content: {
                        Text("No product added to the cart yet.")
                    })
                }
                else{
                
                    ForEach(products.compactMap({$0}), id: \.self){ product in
                        
                
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
                            Text("₹\(product.price , specifier: "%.2f")")
                                .font(.body.bold())
                            
                        })
//                        Stepper("Quntity:0\(product.quantity ?? 0)", value: Binding(get: {
//                            product.quantity ?? 0
//                        }, set: { qnty in
//                            product.quantity = qnty
//                        }), in: 1...9)
//                            .bold()
//                            .foregroundColor(.red)
//                            .font(.title3)
                        
                    }
                    

                }
//                if(products.count > 0)
//                {
//                    Stepper("Quntity:0\(quntity)", value: $quntity, in: 1...9)
//                        .bold()
//                        .foregroundColor(.red)
//                        .font(.title3)
//                }
                
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

