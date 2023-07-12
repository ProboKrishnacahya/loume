//
//  afterQuestion1View.swift
//  loume
//
//  Created by Yohan Wijaya on 07/07/23.
//

import SwiftUI

struct AfterQuestion1View: View {
    @State var fadeText1: Double = 1
    @State var condition1: Double = 1
    @State var condition2: Double = 0
    @State var condition3: Double = 0
    @State var fadeText2: Double = 0
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text("Awasome !")
                    Text("Some people don’t really know themselves that much yet, but you do! ")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition1 = 0
                        fadeText2 = 1
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .background(Color("Chinese Orange"))
                        .foregroundColor(Color.white)
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Axolotl"), lineWidth: 1)
                            
                        )
                }
                    Button {
                        
                    }
                label: {
                    Text("Save for Later")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .foregroundColor(Color("Chinese Orange"))
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Chinese Orange"), lineWidth: 1)
                            
                        )
                }
                    
                }
                .opacity(condition1)
                VStack{
                    
                    Text("Cool! You still have plenty of time to explore more about your strengths, take your time!")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition1 = 0
                        fadeText2 = 1
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .background(Color("Chinese Orange"))
                        .foregroundColor(Color.white)
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Axolotl"), lineWidth: 1)
                            
                        )
                }
                    Button {
                        
                    }
                label: {
                    Text("Save for Later")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .foregroundColor(Color("Chinese Orange"))
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Chinese Orange"), lineWidth: 1)
                            
                        )
                }
                    
                }
                .opacity(condition2)
                VStack{
                    
                    Text("Hmm… having trouble thinking of any? It’s okay! Sometimes it takes some time to realize where our strength lies.")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition1 = 0
                        fadeText2 = 1
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .background(Color("Chinese Orange"))
                        .foregroundColor(Color.white)
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Axolotl"), lineWidth: 1)
                            
                        )
                }
                    Button {
                        
                    }
                label: {
                    Text("Save for Later")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .foregroundColor(Color("Chinese Orange"))
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Chinese Orange"), lineWidth: 1)
                            
                        )
                }
                    
                }
                .opacity(condition3)
                VStack{
                    Text("Now that we know your strengths, we also need to be mindful of the opposite; your weaknesses. ")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                }
                .opacity(fadeText2)
                
            }
        }
    }
}

struct AfterQuestion1View_Previews: PreviewProvider {
    static var previews: some View {
        AfterQuestion1View(userListCoreDataViewModel: UserListCoreDataViewModel(),
                           goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                           planListCoreDataViewModel: PlanListCoreDataViewModel(),
                           subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                           loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
