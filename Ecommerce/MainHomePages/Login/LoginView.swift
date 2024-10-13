//
//  Login.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email:String
    @State var password:String
    @State var user: User

    var body: some View {
        
        
        VStack(alignment: .leading, content: {
            HStack{
                Spacer()
                Text("Welcome Back !")
                    .font(.title)
                    .bold()
                Spacer()
            }
            HStack{
                Spacer()
                Text("Put Your Data here")
                    .font(.title3)
                    .padding()
                Spacer()
            }
            
            Text("Email")
                .padding()
            TextField("Enter Your Email", text: $email)
                .padding()
                .frame(width: UIScreen.main.bounds.width-30,height: 30)
//                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }.padding(5)
            
            Text("Password")
                .padding()
            SecureField("Enter Your Password", text: $password)
                .padding()
                .frame(width: UIScreen.main.bounds.width-30,height: 30)
//                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }.padding(5)
            
            HStack() {
                Spacer()
                Button(action: {
                    //
                }, label: {
                    Text("Forget Password")
                })
                .frame(height: 40,alignment: .bottomTrailing)
            }
            Button(action: {
                //Call API for Login
                user = User(username: "myusername", userId: 201)
            }, label: {
                Text("Sign in")
                    .font(.title3)
                    .bold()
            })
            .buttonStyle(ConfirmButton())
            Text("Don't have any Account? ")
            Button(action: {
                
            }, label: {
                Text("Sign UP")
            })
//            .environment(\.user, user)
        })
    }
}

#Preview {
    LoginView(
        email: "", password: "", user: User(username: "", userId: 201)
    )
}


struct User: Codable{
    
    var username: String
    var userId: Int64
}
