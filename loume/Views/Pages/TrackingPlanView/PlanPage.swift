//
//  PlanPage.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct PlanPage: View {
    //    @EnvironmentObject var userData: User
    @ObservedObject var userData: User
    @Environment(\.presentationMode) var presentationMode
    @State var isSheetPresented = false
    @Binding var inputTextValues: [[[String]]]
    
    let goal: Goal
    let goalIndex: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(goal.getName())
                        .font(.largeTitle.bold())
                    
                    HStack {
                        Text(goal.getDueDate())
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        CircularButton(userData: userData, isSheetPresented: $isSheetPresented, type: "plan", goal: goal, inputTextValues: $inputTextValues, goalIndex: goalIndex)
                    }
                }
                .padding()
                
                if goal.getPlans().isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "folder.badge.questionmark")
                            .font(.system(size: 64))
                        
                        Text("Your plans are still empty.\n**Let's make your plans!**")
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(.gray)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(goal.getPlans().indices, id: \.self) { groupIndex in
                                var plan = goal.getPlanWithIndex(planIndex: groupIndex)
                                
                                GeometryReader { geometry in
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color("Light Moss Green"))
                                        .overlay(
                                            VStack {
                                                VStack(spacing: 4) {
                                                    Text(plan.getName())
                                                        .font(.title2.bold())
                                                    Text(plan.getDueDate()).font(.subheadline).foregroundColor(.secondary)
                                                }
                                                
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 16)
                                                        .fill(.white)
                                                    GeometryReader { geometry in
                                                        List {
                                                            ForEach(plan.getSubPlans().indices, id: \.self) { index in
                                                                
                                                                var subPlan = plan.getSubPlanWithIndex(index: index)
                                                                
                                                                HStack {
                                                                    Button(action: {
                                                                        subPlan.is_done.toggle()
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
                                                                    .padding(.leading, 28)
                                                                    
                                                                    TextField(subPlan.getName().isEmpty ? "New Subplan" : subPlan.getName(),
                                                                              text: self.bindingForTextField(groupIndex: groupIndex, textFieldIndex: index),
                                                                              onCommit: {
                                                                        plan.saveSubPlan(index: index, newSubPlan: inputTextValues[goalIndex][groupIndex][index], plan: plan)
                                                                    })
                                                                    .listRowBackground(Color.clear)
                                                                    .frame(width: geometry.size.width)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    .listStyle(.plain)
                                                    .padding()
                                                }
                                                
                                                Button(action: {
                                                    plan.addSubPlan(name: "", is_done: false, plan: plan)
                                                    
                                                    inputTextValues[goalIndex][groupIndex].append("")
                                                }, label: {
                                                    HStack {
                                                        Image(systemName: "plus.circle")
                                                            .bold()
                                                        Text("\(plan.getSubPlans().count)")
                                                            .bold()
                                                    }
                                                    .padding(.vertical, 4)
                                                })
                                                .foregroundColor(Color("Axolotl"))
                                            }
                                                .padding()
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
                                .frame(width: UIScreen.main.bounds.width - 48, height: 480)
                            }
                        }
                        .padding()
                    }
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
        PlanPage(userData: User(name: "", goals: []), inputTextValues: .constant([[[""]]]), goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()), goalIndex: 0)
    }
}
