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
    //    @State var condition1: Double = 0
    //    @State var condition2: Double = 0
    //    @State var condition3: Double = 0
    //    @State var isStrengthFulled: Bool = false
    //    @State var sumNullWeakness: Int = 0
    
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
                                //                                isReflectActive = true
                                
                                userListCoreDataViewModel.saveUserEntity(name: "")
                            }
                        //                            .overlay{
                        //                                NavigationLink(destination: SetupProject(moveUp: true, moveUp2: true, moveUpCircle: true, moveUpText: true, isView2Active: false, moveUpTextField: true, fadeText1: false, offset: CGSize.zero, fadeText2: false, fadeOutCircle: 1, text1: 90, name: "", scale2: 1).navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                }
                        //                            }
                        
                    } else {
                        PrimaryButton(label: "Continue Reflect")
                            .onTapGesture {
                                //                                isReflectActive = true
                                
                                //                                if userListCoreDataViewModel.userEntities[0].pageTag == "2" {
                                
                                //                                    var sumNullStrength = 0
                                //                                    if userListCoreDataViewModel.userEntities[0].strength1.isEmpty {
                                //                                        sumNullStrength += 1
                                //                                    }
                                //
                                //                                    if userListCoreDataViewModel.userEntities[0].strength2.isEmpty {
                                //                                        sumNullStrength += 1
                                //                                    }
                                //
                                //                                    if userListCoreDataViewModel.userEntities[0].strength3.isEmpty {
                                //                                        sumNullStrength += 1
                                //                                    }
                                //
                                //                                    if sumNullStrength == 0 {
                                //                                        condition1 = 1
                                //                                        condition2 = 0
                                //                                        condition3 = 0
                                //                                        isStrengthFulled = true
                                //                                    } else if sumNullStrength == 3 {
                                //                                        condition1 = 0
                                //                                        condition2 = 0
                                //                                        condition3 = 1
                                //                                        isStrengthFulled = false
                                //                                    } else {
                                //                                        condition1 = 0
                                //                                        condition2 = 1
                                //                                        condition3 = 0
                                //                                        isStrengthFulled = false
                                //                                    }
                                
                                //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "3" {
                                
                                //                                    sumNullWeakness = 0
                                //                                    if userListCoreDataViewModel.userEntities[0].weakness1.isEmpty {
                                //                                        sumNullWeakness += 1
                                //                                    }
                                //
                                //                                    if userListCoreDataViewModel.userEntities[0].weakness2.isEmpty {
                                //                                        sumNullWeakness += 1
                                //                                    }
                                //
                                //                                    if userListCoreDataViewModel.userEntities[0].weakness3.isEmpty {
                                //                                        sumNullWeakness += 1
                                //                                    }
                                //                                }
                                
                                userListCoreDataViewModel.setIsJournaling()
                            }
                        //                            .overlay {
                        
                        //                                if userListCoreDataViewModel.userEntities[0].pageTag == "0" {
                        
                        //                                    NavigationLink(destination: RoleModelView().navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        
                        //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "1" {
                        
                        //                                    NavigationLink(destination: StrengthOut().navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        
                        //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "2" {
                        //
                        //                                    NavigationLink(destination: AfterQuestion1View(condition1: $condition1, condition2: $condition2, condition3: $condition3, isStrengthFulled: $isStrengthFulled).navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        
                        //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "3" {
                        
                        //                                    NavigationLink(destination: InterestPromiseView(sumNullWeakness: $sumNullWeakness).navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        
                        //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "4" {
                        //                                    yohan
                        
                        //                                    NavigationLink(destination: InterestPromiseView(sumNullWeakness: $sumNullWeakness).navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        
                        //                                } else if userListCoreDataViewModel.userEntities[0].pageTag == "5" {
                        //
                        //                                    NavigationLink(destination: AfterObstacleView().navigationBarBackButtonHidden(true), isActive: $isReflectActive) {
                        //                                    }
                        //
                        //                                }
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
