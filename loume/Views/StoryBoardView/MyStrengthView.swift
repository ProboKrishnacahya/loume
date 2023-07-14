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
    @State private var isView3Active = false
    
    var maximumDateGoal: Date{
        return max(Date(), goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].dueDate)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
                    
                    Text("Steps I need to take to")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    if goalListCoreDataViewModel.goalEntities.count > 0 {
                        Text(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                    
                    HStack{
                        Spacer()
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
                        
                        Spacer()
                        
                        DatePicker("", selection: $dueDate1, in: Date.now...maximumDateGoal, displayedComponents: .date)
                            .tint(Color("Axolotl"))
                            .labelsHidden()
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack{
                        Spacer()
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
                        
                        Spacer()
                        
                        DatePicker("", selection: $dueDate2, in: Date.now...maximumDateGoal, displayedComponents: .date)
                            .tint(Color("Axolotl"))
                            .labelsHidden()
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    HStack{
                        Spacer()
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
                        
                        Spacer()
                        
                        DatePicker("", selection: $dueDate3, in: Date.now...maximumDateGoal, displayedComponents: .date)
                            .tint(Color("Axolotl"))
                            .labelsHidden()
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                }
                .padding()
                
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
                            Text("2")
                                .font(.callout)
                            Text("of")
                                .font(.callout)
                            Text("2")
                                .font(.callout)
                        }
                        Spacer()
                        Circle()
                            .frame(width: 80.0)
                            .padding(.trailing)
                            .foregroundColor(plan1.isEmpty || plan2.isEmpty || plan3.isEmpty ? .gray : Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.right")
                                    .padding(.trailing)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                
                                if goalListCoreDataViewModel.goalEntities.count > 0 {
                                    planListCoreDataViewModel.addPlanEntity(name: plan1, dueDate: dueDate1, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1])
                                    
                                    planListCoreDataViewModel.addPlanEntity(name: plan2, dueDate: dueDate2, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1])
                                    
                                    planListCoreDataViewModel.addPlanEntity(name: plan3, dueDate: dueDate3, goalCoreDataModel: goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1])
                                }
                                
                                isView3Active = true
                            }
                            .overlay(
                                NavigationLink(destination: ConfidentView().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
                                    EmptyView()
                                }
                            )
                            .disabled(plan1.isEmpty || plan2.isEmpty || plan3.isEmpty)
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
