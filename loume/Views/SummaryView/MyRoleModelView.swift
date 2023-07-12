//
//  MyRoleModelView.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyRoleModelView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Role Model")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        UpdateButton()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("In the design field, I also have a role model and it is..")
                        
                        SummaryResultCard(label: "Kak Ari")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("is an amazing figure, because..")
                        
                        SummaryResultCard(label: "1. He is Creative\n2. He is a Design Lecturer\n3. He is Smart")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("and it is very cool! because I have similar strengths with Kak Ari, such as...")
                        
                        SummaryResultCard(label: "Creativity and I like to design")
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

struct MyRoleModelView_Previews: PreviewProvider {
    static var previews: some View {
        MyRoleModelView()
    }
}
