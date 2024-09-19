//
//  RegistrationView.swift
//  Ecommerce
//
//  Created by Avinash on 18/09/2024.
//

import Foundation
import SwiftUI


struct RegistrationView: View {
    
    @State var fullName: String
    @State var email: String
    @State var phoneNumber: String
    @State var password: String
    @State var confirmPassword: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Thank you for Choosing us!")
                .font(.title)
                .bold()
            Text("Lets help you finish sign up.")
            
            Spacer(minLength: 40)
            Text("Full Name")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.default)
                .autocorrectionDisabled()
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .overlay {
                    //rounded + border
                //padding
//                    Capsule()
//                        .frame(width: 100,height: 30,alignment: .leading)
//                        .opacity(0.2)
//                    Text("Enter Your Full Name")
//                        .frame(alignment: .leading)
//                        .opacity(0.2)
//                        .foregroundColor(.black)
                    
                        
                        
                }

            
            Text("Email")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()


            Text("Phone Number")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.phonePad)
                .autocorrectionDisabled()


            Text("Password")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.default)
                .autocorrectionDisabled()

            Text("Confirm Password")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.default)
                .autocorrectionDisabled()

            Spacer(minLength: 40)

            Button(action: {
                //API
                //Navigate to Home View
            }, label: {
                Text("Sign Up")
                    .font(.title)
                    .frame(width: 250,height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
            })

        })
        .padding()
    }
}
#Preview {
    RegistrationView(fullName: "", email: "", phoneNumber: "", password: "", confirmPassword: "")
}
