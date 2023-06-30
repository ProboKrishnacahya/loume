//
//  Goals.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct GoalPage: View {
    @EnvironmentObject var userData: User
    @State var inputTextValues: [[[String]]] = [[[""]]]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    HStack {
                        Text("Your Goals")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        CircularButton(type: "goal", goalIndex: 0, inputTextValues: $inputTextValues)
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
                                NavigationLink(destination: PlanPage(goalIndex: index, inputTextValues: $inputTextValues)) {
                                    GoalResult(goalIndex: index)
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

// Card for Goal Data
struct GoalResult: View {
    @EnvironmentObject var userData: User
    var goalIndex: Int
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(userData.getGoalWithIndex(index: goalIndex).getName())
                        .font(.title2.bold())
                    
                    Spacer()
                }
                
                Text("Deadline: \(userData.getGoalWithIndex(index: goalIndex).getTimeLeft())")
                
                Text("Due: \(userData.getGoalWithIndex(index: goalIndex).getDueDate())")
                    .font(.subheadline)
                    .foregroundColor(Color("Light Moss Green"))
                
                Text("Subplan: \(userData.getGoalWithIndex(index: goalIndex).getPercentageProgress(userData: userData, goalIndex: goalIndex))")
                
                Text("Done: \(userData.getGoalWithIndex(index: goalIndex).sumisdone(userData: userData, goalIndex: goalIndex))")
            }
            
            Spacer()
            
            HStack {
                ProgressView(value: Double(userData.getGoalWithIndex(index: goalIndex).getPercentageProgress(userData: userData, goalIndex: goalIndex)))
                    .progressViewStyle(.linear)
                    .tint(Color("Light Moss Green"))
                    .background(
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .scaleEffect(x: CGFloat(userData.getGoalWithIndex(index: goalIndex).getPercentageProgress(userData: userData, goalIndex: goalIndex) == 0 ? 1 : userData.getGoalWithIndex(index: goalIndex).getPercentageProgress(userData: userData, goalIndex: goalIndex)), y: 1.0, anchor: .leading)
                        }
                    )
                    .cornerRadius(6)
                
                Text("\(String(format: "%.2f", userData.getGoalWithIndex(index: goalIndex).getPercentageProgress(userData: userData, goalIndex: goalIndex)))%")
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
        GoalPage().environmentObject(User(name: "", goals: []))
    }
}
