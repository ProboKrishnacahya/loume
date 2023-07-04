//
//  Goals.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct GoalPage: View {
    //    @EnvironmentObject var userData: User
    @State var inputTextValues: [[[String]]] = [[[""]]]
    @State var isSheetPresented: Bool = false
    @ObservedObject var userData: User
    
    let backgroundColor: Color
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 24) {
                        HStack {
                            Text("Your Goals")
                                .font(.largeTitle.bold())
                            
                            Spacer()
                            
                            CircularButton(userData: userData, isSheetPresented: $isSheetPresented, dueDate: Date(), type: "goal", goal: Goal(name: "", plans: [], dueDate: Date()), inputTextValues: $inputTextValues, goalIndex: 0)
                        }
                        
                        VStack {
                            if userData.getGoals().isEmpty {
                                VStack(spacing: 16) {
                                    Image(systemName: "folder.badge.questionmark")
                                        .font(.system(size: 64))
                                    
                                    Text("Your goals are still empty.\n**Let's make your goals!**")
                                        .multilineTextAlignment(.center)
                                }
                                .foregroundColor(.gray)
                            } else {
                                
                                ForEach(0..<userData.getGoals().count, id: \.self) { index in
                                    NavigationLink(destination: PlanPage(userData: userData, inputTextValues: $inputTextValues, goal: userData.getGoalWithIndex(index: index), goalIndex: index)) {
                                        GoalResult(userData: userData, goal: userData.getGoalWithIndex(index: index))
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Goals")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .tint(Color("Axolotl"))
        }
    }
}

// Card for Goal Data
struct GoalResult: View {
    //    @EnvironmentObject var userData: User
    @ObservedObject var userData: User
    
    var goal: Goal
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(goal.getName())
                        .font(.title2.bold())
                    
                    Spacer()
                }
                
                Text("Due: \(goal.getDueDate())")
                    .font(.subheadline)
                    .foregroundColor(Color("Light Moss Green"))
                
                Text("Deadline: \(goal.getTimeLeft())")
                
                Text("Subplan: \(goal.sumSubPlan(goal: goal))")
                
                Text("Done: \(goal.sumIsDone(goal: goal))")
            }
            
            Spacer()
            
            HStack {
                ProgressView(value: Double(goal.getPercentageProgress(goal: goal)), total: 100)
                    .progressViewStyle(.linear)
                    .tint(Color("Light Moss Green"))
                    .background(
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .scaleEffect(x: CGFloat(goal.getPercentageProgress(goal: goal) == 0 ? 1 : goal.getPercentageProgress(goal: goal)), y: 1.0, anchor: .leading)
                        }
                    )
                    .cornerRadius(6)
                
                Text("\(String(format: "%.2f", goal.getPercentageProgress(goal: goal)))%")
                    .font(.headline)
            }
        }
        .padding()
        .background(Color("Axolotl"))
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}

struct GoalPage_Previews: PreviewProvider {
    static var previews: some View {
        GoalPage(userData: User(name: "", goals: []), backgroundColor: Color("Lotion"))
    }
}
