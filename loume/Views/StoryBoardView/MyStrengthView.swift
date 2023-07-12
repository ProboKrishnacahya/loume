//
//  myStrengthView.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct MyStrengthView: View {
    @State var roleModel1: String = ""
    @State var roleModel2: String = ""
    @State var roleModel3: String = ""
    
    @State private var isView2Active = false
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    Text("Steps I need to take to")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    Text("be a choreograper")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                    HStack{
                        Circle()
                            .frame(width: 30.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text("1")
                                    .foregroundColor(Color.white)
                            }
                        TextField("Enter username...", text: $roleModel1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                            .frame(width:  250)
                            .animation(Animation.easeInOut(duration: 1.5))
                    }.padding(.top)
                    HStack{
                        Circle()
                            .frame(width: 30.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text("2")
                                    .foregroundColor(Color.white)
                            }
                        TextField("Enter username...", text: $roleModel2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                            .frame(width:  250)
                            .animation(Animation.easeInOut(duration: 1.5))
                    }
                    .padding(.top, 5)
                    HStack{
                        Circle()
                            .frame(width: 30.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text("3")
                                    .foregroundColor(Color.white)
                            }
                        TextField("Enter username...", text: $roleModel2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                            .frame(width:  250)
                            .animation(Animation.easeInOut(duration: 1.5))
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                }
                VStack{
                    Spacer()
                    HStack{
                        Circle()
                            .frame(width: 80.0)
                            .padding(.leading)
                            .foregroundColor(Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.left")
                                    .padding(.leading)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                
                                isView2Active = true
                                
                            }
                            .overlay(
                                NavigationLink(destination: AfterObstacle2View(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                        
                        Spacer()
                        HStack{
                            Text("1")
                                .font(.callout)
                            Text("of")
                                .font(.callout)
                            Text("1")
                                .font(.callout)
                        }
                        Spacer()
                        Circle()
                            .frame(width: 80.0)
                            .padding(.trailing)
                            .foregroundColor(Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.right")
                                    .padding(.trailing)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                
                                isView2Active = true
                                
                            }
                            .overlay(
                                NavigationLink(destination: ConfidentView(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                    }
                    
                }
            }
        }
    }
}

struct MyStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        MyStrengthView(userListCoreDataViewModel: UserListCoreDataViewModel(),
                       goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                       planListCoreDataViewModel: PlanListCoreDataViewModel(),
                       subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                       loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
