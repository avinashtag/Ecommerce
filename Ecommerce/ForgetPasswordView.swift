//
//  ForgetPasswordView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @State var phoneNumer:String
    var body: some View {
        
        VStack
        {
            Text(" Forget Password")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
        Spacer()
        
        VStack
        {
            Text("Just Enter Your Phone Number, \n and we'll help you the reset your \n password ")
        }.padding(40)
        
        VStack(alignment:.leading,spacing: 15)
        {
            Text("Phone Number")
                .font(.title3)
            TextField("", text: $phoneNumer)
                .frame(width: 250,height: 40)
                .border(Color.gray)
                .cornerRadius(20)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Verification Code")
                    .font(.title3)
                    .bold()
            })
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
            
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ForgetPasswordView(phoneNumer: "")
}
