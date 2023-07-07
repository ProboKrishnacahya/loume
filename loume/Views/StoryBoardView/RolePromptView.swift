//
//  RolePromptPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 03/07/23.
//

import SwiftUI

struct RolePromptView: View {
    let instanceStoryBoardViewModel = StoryBoardViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Button(action: {
                    instanceStoryBoardViewModel.openSafari()
                }, label: {
                    Text("How to be ....")
                })
            }
            .navigationTitle("loume")
        }
    }
}

struct RolePromptView_Previews: PreviewProvider {
    static var previews: some View {
        RolePromptView()
    }
}
