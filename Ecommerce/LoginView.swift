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
            TextField("", text: $email)
                .frame(width: UIScreen.main.bounds.width-30,height: 30)
                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
            
            Text("Password")
            SecureField("", text: $password)
                .frame(width: UIScreen.main.bounds.width-30,height: 30)
                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
            
            HStack() {
                Spacer()
                Button(action: {
                    //
                }, label: {
                    Text("Forget Password")
                })
                .frame(height: 40,alignment: .bottomTrailing)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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

            
        })
    }
}

#Preview {
    LoginView(
        email: "", password: ""
    )
}
