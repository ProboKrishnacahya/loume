//
//  ModalView.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import SwiftUI

struct ModalView: View {
    @Binding var name: String
    @Binding var dueDate: Date
    @Binding var type: String
    @Binding var goal: Goal
    @Binding var isSheetPresented:Bool
    @ObservedObject var userData:User
    @Binding var inputTextValues: [[[String]]]
    let goalIndex: Int
    
    var body: some View {
        NavigationStack {
            formContent
                .padding()
                .navigationBarItems(leading: leadingNavigationContent, trailing: trailingNavigationContent)
                .navigationBarTitle(ModalViewModel().getNavigationBarTitle(type: type))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var maximumDateGoal: Date{
        return max(Date(), goal.getDueDateWithoutFormat())
    }
    
    var formContent: some View {
        VStack(spacing: 16) {
            nameContentForm
            
            if type == "plan" {
                DatePicker("Due Date", selection: $dueDate, in: Date.now...maximumDateGoal, displayedComponents: .date)
                    .tint(Color("Axolotl"))
            } else {
                DatePicker("Due Date", selection: $dueDate, in: Date.now..., displayedComponents: .date)
                    .tint(Color("Axolotl"))
            }
            
            Spacer()
        }
    }
    
    var leadingNavigationContent: some View {
        Button("Cancel") {
            resetForm()
        }
        .foregroundColor(.blue)
    }
    
    var trailingNavigationContent: some View {
        Button("Done") {
            if type == "goal" {
                if userData.getGoals().count > 0 {
                    inputTextValues.append([[""]])
                }
                
                userData.addGoal(name: name, plans: [], dueDate: dueDate)
                userData.objectWillChange.send()
                
            } else {
                if userData.getGoals()[goalIndex].getPlans().count > 0 {
                    inputTextValues[goalIndex].append([""])
                }
                
                userData.getGoals()[goalIndex].addPlan(name: name, dueDate: dueDate, subPlans: [SubPlan(name: "", is_done: false)])
                userData.objectWillChange.send()
            }
            resetForm()
        }
        .foregroundColor(self.name.isEmpty ? .secondary : Color("Axolotl"))
        .disabled(self.name.isEmpty)
    }
    
    var nameContentForm: some View {
        VStack(alignment: .leading) {
            Text(ModalViewModel().getNameFormDescription(type: type))
            
            TextField(ModalViewModel().getNameFormDescription(type: type), text: $name)
                .textFieldStyle(.roundedBorder)
                .tint(Color("Axolotl"))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.tertiary, lineWidth: 2)
                )
        }
    }
    
    func resetForm() {
        dueDate = Date()
        name = ""
        isSheetPresented = false
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(name: .constant("Name 1"),
                  dueDate: .constant(Date()),
                  type: .constant("goal"),
                  goal: .constant(Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())),
                  isSheetPresented: .constant(true),
                  userData: User(name: "name 1", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]),
                  inputTextValues: .constant([[[""]]]),
                  goalIndex: 0)
    }
}
