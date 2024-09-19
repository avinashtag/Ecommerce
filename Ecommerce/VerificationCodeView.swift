//
//  VerificationCodeView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct VerificationCodeView: View {
    @State var otp:String
    var body: some View {
        VStack
        {
            Text("Verification Password")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
        .padding()
        Spacer()
        
        VStack(spacing:30)
        {
            Text("Please enter the code sent it your\n email to verify and set a new \npassword")
                .font(.title3)
            
            TextField("",text: $otp)
                .frame(width: 150,height: 40)
                .border(Color.gray)
                .cornerRadius(20)
                .keyboardType(.numberPad)
            
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
        Spacer()
        
    }
}

#Preview {
    VerificationCodeView(otp: "")
}
