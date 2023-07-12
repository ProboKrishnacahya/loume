//
//  CircularButton.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct CircularButton: View {
    @Binding var isSheetPresented: Bool
    @Binding var inputTextValues: [[[String]]]
    @State var name = ""
    @State var dueDate = Date()
    @State var type: String
    @Binding var goal: GoalCoreDataModel
    
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
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
                      isSheetPresented: $isSheetPresented, inputTextValues: $inputTextValues, goalIndex: goalIndex,
                      planListCoreDataViewModel: planListCoreDataViewModel,
                      subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                      goalListCoreDataViewModel: goalListCoreDataViewModel)
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(isSheetPresented: .constant(false),
                       inputTextValues: .constant([[[""]]]), type: "goal",
                       goal: .constant(GoalCoreDataModel(goalEntity: GoalEntity())),
                       goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                       planListCoreDataViewModel: PlanListCoreDataViewModel(),
                       subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                       goalIndex: 0)
    }
}
