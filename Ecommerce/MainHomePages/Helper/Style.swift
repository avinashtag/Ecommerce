//
//  Style.swift
//  Ecommerce
//
//  Created by Avinash on 19/09/2024.
//

import Foundation
import SwiftUI

struct ConfirmButton: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width - 30 ,height: 50)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.capsule)
    }

    
    
}

//Textfield

