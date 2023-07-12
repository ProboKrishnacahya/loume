//
//  CircularButton.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CreateButton: View {
    
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    @EnvironmentObject private var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
    @Binding var isSheetPresented: Bool
    @Binding var inputTextValues: [[[String]]]
    @State var name = ""
    @State var dueDate = Date()
    @State var type: String
    @Binding var goal: GoalCoreDataModel
    
    let goalIndex: Int
    
    var body: some View {
        Button(action: {
            CircularButtonViewModel().showModal(isSheetPresented: &isSheetPresented)
        }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color("Chinese Orange"))
                .clipShape(Circle())
        }
        .sheet(isPresented: $isSheetPresented) {
            ModalView(name: $name, dueDate: $dueDate, type: $type, goal: $goal,
                      isSheetPresented: $isSheetPresented, inputTextValues: $inputTextValues, goalIndex: goalIndex)
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateButton(isSheetPresented: .constant(false),
                     inputTextValues: .constant([[[""]]]), type: "goal",
                     goal: .constant(GoalCoreDataModel(goalEntity: GoalEntity())),
                     goalIndex: 0)
    }
}
