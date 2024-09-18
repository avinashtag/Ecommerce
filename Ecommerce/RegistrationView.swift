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
    @Binding var email: String
    @State var phoneNumber: String
    @State var password: String
    @State var confirmPassword: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Thank you for Choosing us!")
                .font(.title)
            Text("Lets help you finish sign up.")
            
            Spacer(minLength: 40)
            Text("Full Name")
            TextField("", text: $fullName)
                .font(.body)
                .keyboardType(.default)
                .autocorrectionDisabled()
                .overlay {
                    //rounded + border
                //padding
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
            })

        })
        .padding()
    }
}
