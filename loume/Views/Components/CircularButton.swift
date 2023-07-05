//
//  CircularButton.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CircularButton: View {
    //    @EnvironmentObject var userData: User
    @ObservedObject var userData: User
    @Binding var isSheetPresented: Bool
    @State var name = ""
    @State var dueDate = Date()
    @State var type: String
    @State var goal: Goal
    @Binding var inputTextValues: [[[String]]]
    let goalIndex: Int
    
    var body: some View {
        Button(action: {
            isSheetPresented = true
        }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color("Axolotl"))
                .clipShape(Circle())
        }
        .sheet(isPresented: $isSheetPresented) {
            ModalView(name: $name, dueDate: $dueDate, type: $type, goal: $goal, isSheetPresented: $isSheetPresented, userData: userData, inputTextValues: $inputTextValues, goalIndex: goalIndex)
        }
    }
}

struct ModalView: View {
    @Binding var name: String
    @Binding var dueDate: Date
    @Binding var type: String
    @Binding var goal: Goal
    @Binding var isSheetPresented:Bool
    @ObservedObject var userData:User
    @Binding var inputTextValues: [[[String]]]
    let goalIndex: Int
    var maximumDateGoal: Date{
        return max(Date(), goal.getDueDateWithoutFormat())
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text(type == "goal" ? "Goal Name" : "Plan Name")
                    
                    TextField(type == "goal" ? "Goal Name" : "Plan Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .tint(Color("Axolotl"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.tertiary ,lineWidth: 2)
                        )
                }
                
                if type == "plan" {
                    DatePicker("Due Date", selection: $dueDate, in: Date.now...maximumDateGoal, displayedComponents: .date)
                        .tint(Color("Axolotl"))
                } else if type == "goal" {
                    DatePicker("Due Date", selection: $dueDate, in: Date.now..., displayedComponents: .date)
                        .tint(Color("Axolotl"))
                }
                
                Spacer()
            }
            .padding()
            .navigationBarItems(leading: Button("Cancel") {
                dueDate = Date()
                name = ""
                isSheetPresented = false
            }
                .foregroundColor(.blue),
                                trailing: Button("Done") {
                print("Type",type)
                if type == "goal" {
                    if userData.getGoals().count > 0 {
                        inputTextValues.append([[""]])
                    }
                    userData.addGoal(name: name, plans: [], dueDate: dueDate)
                    userData.objectWillChange.send()
                } else if type == "plan" {
                    if userData.getGoalWithIndex(index: goalIndex).getPlans().count > 0 {
                        inputTextValues[goalIndex].append([""])
                    }
                    
                    userData.getGoalWithIndex(index: goalIndex).addPlan(name: name, dueDate: dueDate, subPlans: [SubPlan(name: "", is_done: false)])
                    userData.objectWillChange.send()
                }
                dueDate = Date()
                name = ""
                isSheetPresented = false
            }
                .foregroundColor(self.name.isEmpty ? .secondary : Color("Axolotl"))
                .disabled(self.name.isEmpty)
            )
            .navigationBarTitle(type == "goal" ? "Add Goal" : "Add Plan")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(userData: User(name: "", goals: []), isSheetPresented: .constant(false), type: "goal", goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()), inputTextValues: .constant([]), goalIndex: 0)
    }
}
