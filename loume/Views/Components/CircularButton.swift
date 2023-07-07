//
//  CircularButton.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CircularButton: View {
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
            CircularButtonViewModel().showModal(isSheetPresented: &isSheetPresented)
        }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color("Axolotl"))
                .clipShape(Circle())
        }
        .sheet(isPresented: $isSheetPresented) {
            ModalView(name: $name, dueDate: $dueDate, type: $type, goal: $goal,
                      isSheetPresented: $isSheetPresented, userData: userData,
                      inputTextValues: $inputTextValues, goalIndex: goalIndex)
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(userData: User(name: "", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]),
                       isSheetPresented: .constant(false),
                       type: "goal",
                       goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()),
                       inputTextValues: .constant([[[""]]]),
                       goalIndex: 0)
    }
}
