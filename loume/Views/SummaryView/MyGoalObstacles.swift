//
//  MyGoalObstacles.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyGoalObstacles: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Goal Obstacles")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        UpdateButton()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("While persue your goal, you afraid of..")
                        
                        SummaryResultCard(label: "Uncertainty future")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Besides, you also need to develop yourself especially on the..")
                        
                        SummaryResultCard(label: "My comfort zone")
                        
                        Text("because it is your biggest blocker.")
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

struct MyGoalObstacles_Previews: PreviewProvider {
    static var previews: some View {
        MyGoalObstacles()
    }
}
