//
//  CircularButton.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CircularButton: View {
    @ObservedObject var userData: User
    @Binding var isSheetPresented: Bool
    @Binding var inputTextValues: [[[String]]]
    @State var name = ""
    @State var dueDate = Date()
    @State var type: String
    @State var goal: Goal
    
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
                      isSheetPresented: $isSheetPresented, inputTextValues: $inputTextValues, userData: userData, goalIndex: goalIndex)
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(userData: User(name: "", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]),
                       isSheetPresented: .constant(false),
                       inputTextValues: .constant([[[""]]]), type: "goal",
                       goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()),
                       goalIndex: 0)
    }
}
