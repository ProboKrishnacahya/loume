//
//  PlanPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct PlanView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var inputTextValues: [[[String]]]
    @State var isSheetPresented = false
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    @State var goal: GoalCoreDataModel
    let goalIndex: Int
    
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                planViewHeader
                
                if planListCoreDataViewModel.planEntities.isEmpty {
                    EmptyStateView(type: "Plan")
                } else {
                    ZStack {
                        ForEach(Array(planListCoreDataViewModel.planEntities.enumerated()), id: \.0) { groupIndex, planObject in
                            let plan = planListCoreDataViewModel.planEntities[groupIndex]
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color("Light Moss Green"))
                                    .frame(maxWidth: UIScreen.main.bounds.width - 136, maxHeight: .infinity)
                                    .padding()
                                
                                VStack(spacing: 0) {
                                    VStack(spacing: 4) {
                                        Text("\(plan.name)")
                                            .font(.title2.bold())
                                        
                                        Text(getDueDateFormat(dueDate: plan.dueDate))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding()
                                    
                                    List {
                                        ForEach(Array(subPlanListCoreDataViewModel.getSubPlanEntitiesArray(planCoreDataModel: plan).enumerated()), id: \.0) { index, subPlanObject in
                                            let subPlan = subPlanListCoreDataViewModel.getSubPlanEntityById(subPlanCoreDataModel: subPlanObject)
                                            
                                            HStack {
                                                
                                                Button(action: {
                                                    subPlanListCoreDataViewModel.setIsDoneSubPlanEntity(subPlanCoreDataModel: subPlan, planCoreDataModel: plan)
                                                    
                                                }) {
                                                    Circle()
                                                        .fill(subPlan.isDone ? Color("Axolotl") : .clear)
                                                        .frame(width: 16)
                                                        .overlay(
                                                            Circle()
                                                                .stroke(subPlan.name.isEmpty ? .secondary : Color("Axolotl"), lineWidth: 2)
                                                        )
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                                .disabled(subPlan.name.isEmpty)
                                                
                                                TextField("New Subplan",
                                                          text: self.bindingForTextField(groupIndex: groupIndex, textFieldIndex: index),
                                                          onCommit: {
                                                    subPlanListCoreDataViewModel.setNameSubPlanEntity(subPlanCoreDataModel: subPlan, name: inputTextValues[goalIndex][groupIndex][index], planCoreDataModel: plan)
                                                })
                                                .font(.subheadline)
                                            }
                                        }
                                    }
                                    .listStyle(.insetGrouped)
                                    .scrollContentBackground(.hidden)
                                    .frame(width: UIScreen.main.bounds.width - 136)
                                    
                                    Button(action: {
                                        subPlanListCoreDataViewModel.addSubPlanEntity(name: "", planCoreDataModel: plan)
                                        inputTextValues[goalIndex][groupIndex].append("")
                                        
                                    }, label: {
                                        HStack {
                                            Image(systemName: "plus.circle")
                                                .bold()
                                            
                                            Text("New Subplan")
                                                .font(.subheadline.bold())
                                        }
                                    })
                                    .foregroundColor(ViewModel.instance.checkingForAddSubPlan(planCoreDataModel: plan, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel) ? .secondary : Color("Axolotl"))
                                    .disabled(ViewModel.instance.checkingForAddSubPlan(planCoreDataModel: plan, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel))
                                    .padding()
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            .scaleEffect(currentIndex == groupIndex ? 1.2 : 1.1)
                            .offset(x: CGFloat(groupIndex - currentIndex) * 320 + dragOffset, y: 0)
                        }
                    }
                    .padding(.top)
                    .gesture(DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 0
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(planListCoreDataViewModel.planEntities.count - 1, currentIndex + 1)
                                }
                            }
                        })
                    )
                    
                    Text("\(currentIndex + 1) of \(planListCoreDataViewModel.planEntities.count)")
                        .padding(.top, 36)
                }
            }
        }
        .onAppear(perform: {
            planListCoreDataViewModel.getPlanEntities(goalCoreDataModel: goal)
            print("planniii", planListCoreDataViewModel.planEntities.count)
            
        })
        .onDisappear {
            print("halooo hilang")
        }
    }
    
    func bindingForTextField(groupIndex: Int, textFieldIndex: Int) -> Binding<String> {
        return Binding<String>(
            get: {
                print("ini",inputTextValues)
                print("ini",groupIndex)
                return inputTextValues[goalIndex][groupIndex][textFieldIndex]
            },
            set: {
                inputTextValues[goalIndex][groupIndex][textFieldIndex] = $0
            }
        )
    }
    
    var planViewHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(goalListCoreDataViewModel.goalEntities[goalIndex].name)
                .font(.largeTitle.bold())
            
            HStack {
                Text(getDueDateFormat(dueDate: goalListCoreDataViewModel.goalEntities[goalIndex].dueDate))
                    .foregroundColor(.secondary)
                
                Spacer()
                
                CircularButton(isSheetPresented: $isSheetPresented,
                               inputTextValues: $inputTextValues,
                               type: "plan",
                               goal: $goal,
                               goalListCoreDataViewModel: goalListCoreDataViewModel,
                               planListCoreDataViewModel: planListCoreDataViewModel,
                               subPlanListCoreDataViewModel: subPlanListCoreDataViewModel,
                               goalIndex: goalIndex)
            }
        }
        .padding()
    }
    
    func getDueDateFormat(dueDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy"
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: dueDate)
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView(inputTextValues: .constant([
            [
                [""], [""]
            ],
        ]),
                 goal: GoalCoreDataModel(goalEntity: GoalEntity()),
                 goalIndex: 0,
                 goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                 planListCoreDataViewModel: PlanListCoreDataViewModel(),
                 subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel()
        )
    }
}

