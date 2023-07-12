//
//  MyStrengthsView.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyStrengthsView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Strengths")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        UpdateButton()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("I know that I'm good at..")
                        
                        SummaryResultCard(label: "Drawing and illustrating")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("During the journey, I always try to improve and upgrade myself by..")
                        
                        SummaryResultCard(label: "Joining workshops, and trying new drawing styles")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("People around me often give me such as..")
                        
                        SummaryResultCard(label: "I'm pretty good at drawing")
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

struct MyStrengthsView_Previews: PreviewProvider {
    static var previews: some View {
        MyStrengthsView()
    }
}
