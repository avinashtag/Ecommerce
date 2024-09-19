//
//  ContentView.swift
//  Ecommerce
//
//  Created by Avinash on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State var password: String
  
    var body: some View {
        NavigationView(content: {
            VStack(spacing: 20, content: {
                Image(systemName: "Registration")
                    .frame(width: 100, height: 100)
                Text("Your Favourite place of shopping!")
                    .font(.title2)
                    .bold()
                NavigationLink {
                    EnterNewPasswordView(password: $password, confirmPassword: "")

//                    RegistrationView(fullName: "", email: "", phoneNumber: "", password: "", confirmPassword: "")
                } label: {
                    Text("Get Started")
                        .bold()
                }


            })  
            .padding()
        })

    }
}

#Preview {
    ContentView(password: "")
}
