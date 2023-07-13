//
//  myStrengthView.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct MyStrengthView: View {
    
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    
    @State var plan1: String = ""
    @State var plan2: String = ""
    @State var plan3: String = ""
    @State var dueDate1: Date = Date()
    @State var dueDate2: Date = Date()
    @State var dueDate3: Date = Date()
    @State private var isView2Active = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
                    
                    Text("Steps I need to take to")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    if goalListCoreDataViewModel.goalEntities.count > 0 {
                        Text("be a \(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                    
                    HStack{
                        Circle()
                            .frame(width: 30.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text("1")
                                    .foregroundColor(Color.white)
                            }
                        
                        TextField("Enter your step...", text: $plan1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width:  250)
                            .animation(Animation.easeInOut(duration: 1.5))
                    }
                    .padding(.top)
                    
                    HStack{
                        Circle()
                            .frame(width: 30.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text("2")
                                    .foregroundColor(Color.white)
                            }
                        
                        TextField("Enter your step...", text: $plan2)
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
                        TextField("Enter your step...", text: $plan3)
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
                                NavigationLink(destination: AfterObstacle2View().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
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
                                
                                if goalListCoreDataViewModel.goalEntities.count > 0 {
                                    planListCoreDataViewModel.addPlanEntity(name: plan1, dueDate: dueDate1, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[0])
                                    
                                    planListCoreDataViewModel.addPlanEntity(name: plan2, dueDate: dueDate2, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[0])
                                    
                                    planListCoreDataViewModel.addPlanEntity(name: plan3, dueDate: dueDate3, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[0])
                                }
                                
                                isView2Active = true
                            }
                            .overlay(
                                NavigationLink(destination: ConfidentView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
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
        MyStrengthView()
            .environmentObject(GoalListCoreDataViewModel())
            .environmentObject(PlanListCoreDataViewModel())
    }
}
