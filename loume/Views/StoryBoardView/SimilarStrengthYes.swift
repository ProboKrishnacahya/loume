//
//  similarStrengthYes.swift
//  LocalLoumeStory
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthYes: View {
    @State var roleModel1: String = ""

    var body: some View {
        VStack{
            VStack{
                Text("Cool! Please mention one")
                    .font(.title2)
                Text("similarity between you and")
                    .font(.title2)
                Text("MarkLee")
                    .fontWeight(.bold)
                    .font(.title2)
            }
            TextField("Enter username...", text: $roleModel1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:  290)
                .animation(Animation.easeInOut(duration: 1.5))
                .padding(.top, 20)
            
            
            
            
        }
    }
}

struct SimilarStrengthYes_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthYes()
    }
}
