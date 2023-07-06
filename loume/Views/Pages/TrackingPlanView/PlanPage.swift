//
//  PlanPage.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct PlanPage: View {
    @ObservedObject var userData: User
    @Environment(\.presentationMode) var presentationMode
    @Binding var inputTextValues: [[[String]]]
    @State var isSheetPresented = false
    @State var selectedTabIndex = 0
    
    let goal: Goal
    let goalIndex: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(goal.getName())
                        .font(.largeTitle.bold())
                    
                    HStack {
                        Text(userData.getDueDateFormat(dueDate: goal.getDueDateWithoutFormat()))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        CircularButton(userData: userData, isSheetPresented: $isSheetPresented, type: "plan", goal: goal, inputTextValues: $inputTextValues, goalIndex: goalIndex)
                    }
                }
                .padding()
                
                if goal.getPlans().isEmpty {
                    EmptyView(systemNameImage: "folder.badge.questionmark", type: "Plan")
                } else {
                    TabView(selection: $selectedTabIndex) {
                        ForEach(Array(goal.getPlans().enumerated()), id: \.0) { groupIndex, plan in
                            let plan = goal.getPlans()[groupIndex]
                            
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color("Light Moss Green"))
                                    .overlay(
                                        VStack {
                                            VStack(spacing: 4) {
                                                Text(plan.getName())
                                                    .font(.title2.bold())
                                                
                                                Text(userData.getDueDateFormat(dueDate: plan.getDueDateWithoutFormat())).font(.subheadline).foregroundColor(.secondary)
                                            }
                                            
                                            List {
                                                ForEach(Array(plan.getSubPlans().enumerated()), id: \.0) { index, subPlan in
                                                    let subPlan = plan.getSubPlans()[index]
                                                    
                                                    HStack {
                                                        Button(action: {
                                                            subPlan.setIsDone(subPlan: subPlan)
                                                            userData.objectWillChange.send()
                                                        }) {
                                                            Circle()
                                                                .fill(subPlan.getIsDone() ? Color("Axolotl") : .clear)
                                                                .frame(width: 16)
                                                                .overlay(
                                                                    Circle()
                                                                        .stroke(Color("Axolotl"), lineWidth: 2)
                                                                )
                                                        }
                                                        .buttonStyle(PlainButtonStyle())
                                                        
                                                        TextField(subPlan.getName().isEmpty ? "New Subplan" : subPlan.getName(),
                                                                  text: self.bindingForTextField(groupIndex: groupIndex, textFieldIndex: index),
                                                                  onCommit: {
                                                            plan.getSubPlans()[index].setName(newSubPlan: inputTextValues[goalIndex][groupIndex][index])
                                                            userData.objectWillChange.send()
                                                        })
                                                        .listRowBackground(Color.clear)
                                                    }
                                                }
                                            }
                                            .listStyle(.insetGrouped)
                                            .scrollContentBackground(.hidden)
                                            
                                            Button(action: {
                                                plan.addSubPlan(name: "", is_done: false)
                                                userData.objectWillChange.send()
                                                inputTextValues[goalIndex][groupIndex].append("")
                                            }, label: {
                                                HStack {
                                                    Image(systemName: "plus.circle")
                                                        .bold()
                                                    
                                                    Text("New Subplan")
                                                        .bold()
                                                }
                                                .padding(.vertical, 4)
                                            })
                                            .foregroundColor(Color("Axolotl"))
                                        }
                                            .padding(.vertical)
                                    )
                                    .rotation3DEffect(
                                        Angle(
                                            degrees: Double((geometry.frame(in: .global).minX - 10) / -100)
                                        ),
                                        axis: (x: 0, y: 1, z: 0),
                                        anchor: .center,
                                        anchorZ: 0.0,
                                        perspective: 1.0
                                    )
                            }
                            .tag(groupIndex)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: 480)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    Text("\(selectedTabIndex + 1) of \(goal.getPlans().count)")
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    PrimaryButton(label: "Done")
                }
                .padding()
            }
        }
    }
    
    func bindingForTextField(groupIndex: Int, textFieldIndex: Int) -> Binding<String> {
        return Binding<String>(
            get: {
                return inputTextValues[goalIndex][groupIndex][textFieldIndex]
            },
            set: {
                inputTextValues[goalIndex][groupIndex][textFieldIndex] = $0
            }
        )
    }
}

struct PlanPage_Previews: PreviewProvider {
    static var previews: some View {
        PlanPage(userData: User(name: "", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]), inputTextValues: .constant([[[""]]]), goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()), goalIndex: 0)
    }
}
