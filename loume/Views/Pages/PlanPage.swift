//
//  PlanPage.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct PlanPage: View {
    @EnvironmentObject var userData: User
    @Environment(\.presentationMode) var presentationMode
    
    let goalIndex: Int
    @State var isClicked = false
    @Binding var inputTextValues: [[[String]]]
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 0) {
                Text(userData.getGoalWithIndex(index: goalIndex).getName())
                
                HStack {
                    Text(userData.getGoalWithIndex(index: goalIndex).getDueDate())
                        .foregroundColor(.secondary)
                    Spacer()
                    CircularButton(type: "plan", goalIndex: goalIndex, inputTextValues: $inputTextValues)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<userData.getGoalWithIndex(index: goalIndex).getPlans().count, id: \.self) { groupIndex in
                        VStack {
                            VStack(spacing: 4) {
                                Text(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getName())
                                    .font(.title2.bold())
                                Text(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getDueDate())
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                GeometryReader { geometry in
                                    List {
                                        ForEach(0..<userData.getCountOfSubPlans(goalIndex: goalIndex, planIndex: groupIndex), id: \.self) { index in
                                            HStack {
                                                Button(action: {
                                                    userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlanWithIndex(index: index).changeStatus(subPlan:   userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlanWithIndex(index: index))
                                                    isClicked.toggle()
                                                }) {
                                                    Circle()
                                                        .fill(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlanWithIndex(index: index).is_done ? Color("Axolotl") : .clear)
                                                        .frame(width: 16)
                                                        .overlay(
                                                            Circle()
                                                                .stroke(Color("Axolotl"), lineWidth: 2)
                                                        )
                                                }
                                                .padding(.leading, 28)
                                                
                                                TextField(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlanWithIndex(index: index).getName().isEmpty ? "New Subplan" : userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlanWithIndex(index: index).getName(),
                                                          text: self.bindingForTextField(groupIndex: groupIndex, textFieldIndex: index),
                                                          onCommit: {
                                                    userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).saveSubPlan(index: index, newSubPlan: inputTextValues[goalIndex][groupIndex][index], plan: userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex))
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
                                userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).addSubPlan(name: "", is_done: false, plan: userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex))
                                
                                inputTextValues[goalIndex][groupIndex].append("")
                            }, label: {
                                HStack {
                                    Image(systemName: "plus.circle")
                                        .bold()
                                    Text("\(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getSubPlans().count)")
                                        .bold()
                                }
                                .padding(.vertical, 4)
                            })
                            .foregroundColor(Color("Axolotl"))
                        }
                        .padding()
                        .background(Color("Light Moss Green"))
                        .cornerRadius(16)
                        
//                        Text("**\(groupIndex)** of **\(userData.getGoalWithIndex(index: goalIndex).getPlans().count)**")
                    }
                }
                .padding()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                PrimaryButton(label: "Done")
            }
        }
        .padding()
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
        PlanPage(goalIndex: 0, inputTextValues: .constant([[[""]]])).environmentObject(User(name: "", goals: []))
    }
}
