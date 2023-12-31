//
//  EmptyView.swift
//  loume
//
//  Created by Nur Azizah on 06/07/23.
//

import SwiftUI

struct EmptyStateView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State var isReflectActive = false
    
    let type: String
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                if (type == "Goal") {
                    Image("GoalView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 96)
                    
                    Text("You can start planning your goal.\nHowever, reflecting will be an ideal first step!")
                        .multilineTextAlignment(.center)
                    
                } else if (type == "Plan") {
                    Image("GoalView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 96)
                    
                    Text("You can start planning your plan.\nHowever, reflecting will be an ideal first step!")
                        .multilineTextAlignment(.center)
                    
                } else if (type == "Summary") {
                    Image("SummaryView")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 96)
                    
                    Text("Planning your goal requires an in-depth reflection of yourself. Reflect now and get to know yourself better.")
                        .multilineTextAlignment(.center)
                    
                    if userListCoreDataViewModel.userEntities.count == 0 {
                        PrimaryButton(label: "Reflect")
                            .onTapGesture {
                                userListCoreDataViewModel.saveUserEntity(name: "")
                            }
                        
                    } else {
                        PrimaryButton(label: "Continue Reflect")
                            .onTapGesture {
                                userListCoreDataViewModel.setIsJournaling()
                            }
                    }
                }
            }
        }
    }
}


struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(type: "Summary")
    }
}
