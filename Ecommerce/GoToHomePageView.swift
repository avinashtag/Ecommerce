//
//  GoToHomePageView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 18/09/24.
//

import SwiftUI

struct GoToHomePageView: View {
    var body: some View {
        Spacer()
        VStack
        {
            Text("Password Changed \n Sucessfully")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
        Spacer()
        VStack
        {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Go To Home Page")
                    .font(.title3)
                    .bold()
            })
            .frame(width: 290,height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
        }
        Spacer()
    }
}

#Preview {
    GoToHomePageView()
}
