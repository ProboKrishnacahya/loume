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
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var goal: Goal
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
                    EmptyState(systemNameImage: "folder.badge.questionmark", type: "Plan")
                } else {
                    ZStack {
                        ForEach(Array(goal.getPlans().enumerated()), id: \.0) { groupIndex, plan in
                            let plan = goal.getPlans()[groupIndex]
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color("Light Moss Green"))
                                    .frame(maxWidth: UIScreen.main.bounds.width - 136, maxHeight: .infinity)
                                    .padding()
                                
                                VStack(spacing: 0) {
                                    VStack(spacing: 4) {
                                        Text(plan.getName())
                                            .font(.title2.bold())
                                        
                                        Text(userData.getDueDateFormat(dueDate: plan.getDueDateWithoutFormat()))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding()
                                    
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
                                                                .stroke(subPlan.getName().isEmpty ? .secondary : Color("Axolotl"), lineWidth: 2)
                                                        )
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                                .disabled(subPlan.getName().isEmpty)
                                                
                                                TextField("New Subplan",
                                                          text: self.bindingForTextField(groupIndex: groupIndex, textFieldIndex: index),
                                                          onCommit: {
                                                    subPlan.setName(newSubPlan: inputTextValues[goalIndex][groupIndex][index])
                                                    userData.objectWillChange.send()
                                                })
                                            }
                                        }
                                    }
                                    .listStyle(.insetGrouped)
                                    .scrollContentBackground(.hidden)
                                    .frame(width: UIScreen.main.bounds.width - 144)
                                    
                                    Button(action: {
                                        plan.addSubPlan(name: "", is_done: false)
                                        inputTextValues[goalIndex][groupIndex].append("")
                                        userData.objectWillChange.send()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "plus.circle")
                                                .bold()
                                            
                                            Text("New Subplan")
                                                .font(.subheadline.bold())
                                        }
                                    })
                                    .foregroundColor(plan.checkingForAddSubPlan(inputTextValues: inputTextValues) ? .secondary : Color("Axolotl"))
                                    .disabled(plan.checkingForAddSubPlan(inputTextValues: inputTextValues))
                                    .padding()
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            .scaleEffect(currentIndex == groupIndex ? 1.2 : 0.8)
                            .offset(x: CGFloat(groupIndex - currentIndex) * 320 + dragOffset, y: 0)
                        }
                    }
                    .padding(.top)
                    .gesture(DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 0
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(goal.getPlans().count - 1, currentIndex + 1)
                                }
                            }
                        })
                    )
                    
                    Text("\(currentIndex + 1) of \(goal.getPlans().count)")
                        .padding(.top, 36)
                }
            }
            
            Button(action: {
                goal.updateSubPlanArray(inputTextValues: inputTextValues, goalIndex: goalIndex)
                userData.objectWillChange.send()
                presentationMode.wrappedValue.dismiss()
            }) {
                PrimaryButton(label: "Done")
            }
            .padding()
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
        PlanPage(
            userData: User(name: "", goals: [
                Goal(
                    name: "Goal 1",
                    plans: [
                        Plan(
                            name: "Plan 1",
                            subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)],
                            dueDate: Date()
                        ),
                        Plan(
                            name: "Plan 2",
                            subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)],
                            dueDate: Date()
                        ),
                        Plan(
                            name: "Plan 3",
                            subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)],
                            dueDate: Date()
                        )
                    ],
                    dueDate: Date()
                )
            ]),
            inputTextValues: .constant([
                [
                    [""], [""]
                ],
                
            ]),
            goal: Goal(
                name: "Goal 2",
                plans: [
                    Plan(name: "Plan 1",
                         subPlans: [
                            SubPlan(name: "Sub Plan 1", is_done: false)
                         ],
                         dueDate: Date()
                        ),
                    Plan(name: "Plan 2",
                         subPlans: [
                            SubPlan(name: "Sub Plan 1", is_done: false)
                         ],
                         dueDate: Date()
                        )
                ],
                dueDate: Date()
            ),
            goalIndex: 0
        )
    }
}
