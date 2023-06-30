//
//  RolePromptView.swift
//  comee
//
//  Created by Nur Azizah on 27/06/23.
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
            .navigationTitle("comee")
        }
    }
}

struct RolePromptView_Previews: PreviewProvider {
    static var previews: some View {
        RolePromptView()
    }
}
