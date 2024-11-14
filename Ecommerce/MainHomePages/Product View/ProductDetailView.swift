//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 06/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: ProductItem?
    @Binding var navigationPath : NavigationPath
    
    @State var quntity = 0
    @State var selectedImage : Image?
    @State var openCamera : Bool = false

    var body: some View {
        ScrollView
        {
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
    //            var price = (product.price * quntity).toString();
    //            Text("₹\(product?.price ?? 0)")0
                Text("$\(product!.price ?? 0 , specifier: "%.2f")")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color.blue)
                Divider()
                Text("Details")
                    .font(.title3)
                    .underline()
                    .bold()
                Text(product?.explaination ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                Divider()
                
                //quntity button
                Stepper("Quantity:\(quntity)", value: $quntity, in: 1...9)
                    .bold()
                    .foregroundColor(.red)
                    .font(.title3)
                
                HStack{
                    Button(action: {
                        navigationPath.append("Cart")
                    },
                           label: {
                        Text("Buy Now")
                            .font(.title3)
                            .bold()
                            .padding()
                    })
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button(action: {
                        guard let product = product else { return }
                        //check for the existing product
                        SharedEcommerce.shared.cartProducts.insert(product)
                        //                    if SharedEcommerce.shared.cartProducts.contains(where: {$0.id == product.id}) == false {
                        //                        SharedEcommerce.shared.cartProducts.append(product)
                        //                    }
                    },
                           label: {
                        Text("Add To Cart")
                            .font(.title3)
                            .bold()
                            .padding()
                    }
                        )
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)

                }
                
                Button(action: {
                    openCamera.toggle()
                }, label: {
                    Label("Camera", systemImage: "Camera")
                })
                .buttonStyle(.bordered)
                .tint(.blue)
                
                NavigationLink(destination: GalleryView()) {
                    Label("Picture", systemImage: "Camera")
                }
                .buttonStyle(.bordered)
                .tint(.blue)

                
            }
            .navigationDestination(for: String.self) { _ in
                CartView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    MapView()
                } label: {
                    Image(systemName: "map")
                }

            }
        }
        .fullScreenCover(isPresented: $openCamera, content: {
            CameraView(image: $selectedImage )
                .ignoresSafeArea()
        })
        .task {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SuccessLoadAllProducts"), object: nil, queue: nil) { notification in
                
                print("Product Detail Success Notification")
            }
        }
        
    }
}

#Preview {
    ProductDetailView(product: Binding(get: {
        let products = try? Bundle.main.decoder("Products.json", of: [ProductItem].self)
        return products?[12]
    }, set: { _ in
        
    }), navigationPath: Binding(get: {NavigationPath()}, set: {_ in }))
}


//singleton
//next session
//Environment
// Database - SwiftData

// set try
// quantity in views cart and detail
