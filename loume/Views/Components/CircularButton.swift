//
//  CircularButton.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CircularButton: View {
    @EnvironmentObject var userData: User
    @State var isSheetPresented = false
    @State var name = ""
    @State var dueDate = Date()
    @State var type: String
    let goalIndex: Int
    @Binding var inputTextValues: [[[String]]]
    
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
            NavigationStack {
                ModalView(name: $name, dueDate: $dueDate, type: $type)
                    .navigationBarItems(leading: Button("Cancel") {
                        dueDate = Date()
                        name = ""
                        isSheetPresented = false
                    }
                        .foregroundColor(.blue),
                                        trailing: Button("Done") {
                        if type == "goal" {
                            if userData.getGoals().count > 0 {
                                inputTextValues.append([[""]])
                            }
                            userData.addGoal(name: name, plans: [], dueDate: dueDate)
                        } else if type == "plan" {
                            if userData.getGoalWithIndex(index: goalIndex).getPlans().count > 0 {
                                inputTextValues[goalIndex].append([""])
                            }
                            
                            userData.getGoalWithIndex(index: goalIndex).addPlan(name: name, dueDate: dueDate, subPlans: [SubPlan(name: "", is_done: false)])
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
}

struct ModalView: View {
    @Binding var name: String
    @Binding var dueDate: Date
    @Binding var type: String
    
    var body: some View {
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
            
            DatePicker("Due Date", selection: $dueDate, in: Date.now..., displayedComponents: .date)
                .tint(Color("Axolotl"))
            
            Spacer()
        }
        .padding()
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(type: "goal", goalIndex: 0, inputTextValues: .constant([])).environmentObject(User(name: "", goals: []))
    }
}
