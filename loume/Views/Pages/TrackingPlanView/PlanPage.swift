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
    @State var isSheetPresented = false
    @State var isClicked = false
    @Binding var inputTextValues: [[[String]]]
    
    let goalIndex: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(userData.getGoalWithIndex(index: goalIndex).getName())
                        .font(.largeTitle.bold())
                    
                    HStack {
                        Text(userData.getGoalWithIndex(index: goalIndex).getDueDate())
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        CircularButton(isSheetPresented: $isSheetPresented, type: "plan", goalIndex: goalIndex, inputTextValues: $inputTextValues)
                    }
                }
                .padding()
                
                    if userData.getGoalWithIndex(index: goalIndex).getPlans().isEmpty {
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
                                ForEach(0..<userData.getGoalWithIndex(index: goalIndex).getPlans().count, id: \.self) { groupIndex in
                                    GeometryReader { geometry in
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color("Light Moss Green"))
                                            .overlay(
                                                VStack {
                                                    VStack(spacing: 4) {
                                                        Text(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getName())
                                                            .font(.title2.bold())
                                                        Text(userData.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: groupIndex).getDueDate()).font(.subheadline).foregroundColor(.secondary)
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
        PlanPage(inputTextValues: .constant([[[""]]]), goalIndex: 0).environmentObject(User(name: "", goals: []))
    }
}
