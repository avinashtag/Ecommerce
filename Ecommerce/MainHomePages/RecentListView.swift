//
//  RecentListView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 23/09/24.
//

import SwiftUI

struct RecentListView: View {
    var body: some View {
        
//        var allImages =
//        [
//            "AppleWatch",
//            "CasioWatch",
//            "HardDisk",
//            "iPad",
//            "JBLSpeaker",
//            "Jwellery",
//            "PlayStation",
//            "PowerBank",
//            "SunGlasser",
//            "WashingMechine"
//        ]
//        
//        var allImagesNmaes =
//        [
//            "AppleWatch",
//            "CasioWatch",
//            "Sandisk HardDisk",
//            "Apple iPad",
//            "JBLSpeaker",
//            "Jwellery",
//            "PlayStation",
//            "Durocell PowerBank",
//            "Reban SunGlasser",
//            "IFB WashingMechine"
//        ]
        
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            VStack{
                Text("Recent View")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .underline()
                Spacer()
            }
            ScrollView
            {
                
            }
        }
    }
}

#Preview {
    RecentListView()
}

struct iteamsDetails
{
    let id=Int.self

    var name:String
    var image:String
    var details:String
    var price:Int
}

struct Data
{
    let fullDetails =
    [
        iteamsDetails(name: "AppleWatch", image: "AppleWatch",
                      details: "Apple Watch Ultra 2 GPS + Cellular 49mm Black Titanium with Dark Green Alpine Loop  (Black Strap, Free Size)", price: 89999),
        
        iteamsDetails(name: "CasioWatch", image: "CasioWatch",
                      details: "Vintage A158WA-1DF Black Dial Silver Stainless Steel Band Digital Watch - For Men & Women D011", price: 1700),
        iteamsDetails(name: "Sandisk HardDisk", image: "HardDisk",
                      details: "SanDisk E30 / 800 Mbs / Window,Mac OS,Android / Portable,Type C Enabled / USB 3.2 1 TB External Solid State Drive (SSD)  (Black)", price: 9000),
        
        iteamsDetails(name: "CasioWatch", image: "CasioWatch",
                      details: "Vintage A158WA-1DF Black Dial Silver Stainless Steel Band Digital Watch - For Men & Women D011", price: 1700),
        
        iteamsDetails(name: "Apple iPad", image: "iPad",
                      details: "Apple iPad (10th Gen) 64 GB ROM 10.9 inch with Wi-Fi Only (Pink)", price: 34900),
        
        iteamsDetails(name: "CasioWatch", image: "CasioWatch",
                      details: "Vintage A158WA-1DF Black Dial Silver Stainless Steel Band Digital Watch - For Men & Women D011", price: 1700),
        iteamsDetails(name: "Sandisk HardDisk", image: "HardDisk",
                      details: "SanDisk E30 / 800 Mbs / Window,Mac OS,Android / Portable,Type C Enabled / USB 3.2 1 TB External Solid State Drive (SSD)  (Black)", price: 9000),
        
        iteamsDetails(name: "CasioWatch", image: "CasioWatch",
                      details: "Vintage A158WA-1DF Black Dial Silver Stainless Steel Band Digital Watch - For Men & Women D011", price: 1700)
    ]
}
