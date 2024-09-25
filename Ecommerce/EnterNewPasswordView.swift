//
//  EnterNewPasswordView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct EnterNewPasswordView: View {
    @Binding var password:String
    @State var confirmPassword:String
    
    var body: some View {
        VStack()
        {
            Text("Enter New Password")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
        Spacer()
        
        VStack(alignment:.leading, spacing: 10)
        {
            Text("Password")
            SecureField("", text: $password)
                .frame(width: 250,height: 40)
                .border(Color.black)
                .cornerRadius(20)
            
            Text("Confirm Password")
            SecureField("", text: $confirmPassword)
                .frame(width: 250,height: 40)
                .border(Color.black)
                .cornerRadius(20)
        }.padding()
        
        VStack
        {
            NavigationLink(destination: {HomePageView()}) {
                Text("Done")
                    .font(.title3)
                    .bold()

            }
            .frame(width: 200,height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
        }
        Spacer()
    }
}

//#Preview {
////    @State var password: String
////    EnterNewPasswordView(password: "", confirmPassword: "")
//}
