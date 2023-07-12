//
//  MyWeaknessView.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyWeaknessView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Weakness")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        UpdateButton()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("One thing you can dismiss to save yourself is to not..")
                        
                        SummaryResultCard(label: "Procrastinating")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Try avoid this, because it can make yourself stress when working")
                        
                        SummaryResultCard(label: "Over work multitasking")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Another thing to keep in mind is also to focus on what you working by ignoring..")
                        
                        SummaryResultCard(label: "Notification from social media that not related to work")
                    }
                }
                .padding()
                .foregroundColor(Color("Lotion"))
            }
        }
        .background {
            Image("MyRoleModelView")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MyWeaknessView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeaknessView()
    }
}
