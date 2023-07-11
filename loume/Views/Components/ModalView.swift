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
    @Binding var goal: GoalCoreDataModel
    @Binding var isSheetPresented: Bool
    @Binding var inputTextValues: [[[String]]]
    
    let goalIndex: Int
    
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    
    var body: some View {
        NavigationStack {
            formContent
                .padding()
                .navigationBarItems(leading: leadingNavigationContent, trailing: trailingNavigationContent)
                .navigationBarTitle(ModalViewModel().getNavigationBarTitle(type: type))
                .navigationBarTitleDisplayMode(.inline)
        }
        .onDisappear(perform: {
            if type != "goal" {
                planListCoreDataViewModel.getPlanEntities(goalCoreDataModel: goalListCoreDataViewModel.goalEntities[goalIndex])
            }
        })
    }
    
    var maximumDateGoal: Date{
        return max(Date(), goal.dueDate)
    }
    
    var formContent: some View {
        VStack(spacing: 24) {
            
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
    }
    
    var trailingNavigationContent: some View {
        Button("Done") {
            if type == "goal" {
                if goalListCoreDataViewModel.goalEntities.count > 0 {
                    inputTextValues.append([[""]])
                }
                
                goalListCoreDataViewModel.addGoalEntity(name: name, dueDate: dueDate)
                
            } else {
                if goal.plans.count > 0 {
                    inputTextValues[goalIndex].append([""])
                }
                planListCoreDataViewModel.addPlanEntity(name: name, dueDate: dueDate, goalCoreDataModel: goal)
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
                        .stroke(Color("Axolotl"), lineWidth: 2)
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
                  goal: .constant(GoalCoreDataModel(goalEntity: GoalEntity())),
                  isSheetPresented: .constant(true),
                  inputTextValues: .constant([[[""]]]),
                  goalIndex: 0,
                  planListCoreDataViewModel: PlanListCoreDataViewModel(),
                  subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                  goalListCoreDataViewModel: GoalListCoreDataViewModel())
    }
}
