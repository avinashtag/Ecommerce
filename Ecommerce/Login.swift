//
//  Login.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct Login: View {
    
    @State var email:String
    @State var password:String
    
    var body: some View {
        
        VStack(alignment:.center,spacing: -10)
        {
            Text("Welcome Back !")
                .font(.title)
                .bold()
            Text("Put Your Data here")
                .font(.title3)
                .padding()
        }
        .padding(70)
            Spacer()
            VStack(alignment:.leading,spacing: 20)
            {
                Text("Email")
                TextField("", text: $email)
                    .frame(width: 250,height: 40)
                    .border(Color.gray)
                    .cornerRadius(20)
                    
                
                Text("Password")
                SecureField("", text: $password)
                    .frame(width: 250,height: 40)
                    .border(Color.black)
                    .cornerRadius(20)
            }
            
            Spacer()
        
        VStack()
            {
                Button(action: {
                    //
                }, label: {
                    Text("Forget Password")
                })
                .frame(width: 250,height: 40,alignment: .bottomTrailing)
            }
            .padding(-60)
        Spacer()
        VStack
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
        }.padding()
        Spacer()
            
        
        HStack
        {
            Text("Don't have any Account? ")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign UP")
            })
        }
        .padding()
        Spacer()
    }
}

#Preview {
    Login(
        email: "", password: ""
    )
}
