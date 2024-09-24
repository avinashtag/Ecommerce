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
            
            RegistrationCell(textField: $fullName, title: "Full Names")
            RegistrationCell(textField: $fullName, title: "Email")
            RegistrationCell(textField: $fullName, title: "Phone Number")
                .keyboardType(.numberPad)
            RegistrationSecureCell(textField: $fullName, title: "Password")
            RegistrationSecureCell(textField: $fullName, title: "Confirm Password")

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


struct RegistrationCell: View {
    
    @Binding var textField: String
    @State var title: String

    var body: some View {
        Text(title)
        TextField("", text: $textField)
            .font(.body)
            .padding(5)
            .keyboardType(.default)
            .autocorrectionDisabled()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            }
    }
}

struct RegistrationSecureCell: View {
    
    @Binding var textField: String
    @State var title: String

    var body: some View {
        Text(title)
        SecureField("", text: $textField)
            .font(.body)
            .padding(5)
            .keyboardType(.default)
            .autocorrectionDisabled()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            }
    }
}

