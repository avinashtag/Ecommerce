//
//  SignUpOrSignInView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct SignUpOrSignInView: View {
    var body: some View {
        VStack(spacing:40)
        {
            Text("Your Favorite for Shoping")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            Text("Lorem Ipsum is simple dummy text of the \n typsetting industry. Lorem Ipsum has\n been industrie's standard dummy\n text even since the 1505's")
                .font(.headline)
            
            VStack(spacing:15)
            {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sign in")
                        .font(.title3)
                        .bold()
                })
                .frame(width: 250,height: 50)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(30)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sign Up")
                        .font(.title3)
                        .bold()
                })
                .frame(width: 250,height: 50)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(30)
            }
        }
        .padding()
        
    }
}

#Preview {
    SignUpOrSignInView()
}
