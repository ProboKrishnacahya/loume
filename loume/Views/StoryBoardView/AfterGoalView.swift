//
//  AfterGoal.swift
//  loume
//
//  Created by Probo Krishnacahya on 13/07/23.
//

import SwiftUI

struct AfterGoalView: View {
    @State private var isView2Active = false
    var body: some View {
        NavigationStack{
            VStack{
                Text("Sometimes achieving our goals is not that easy because there are challenges we may face.")
                    .multilineTextAlignment(.center)
                    .frame(width: 270.0)
                
                Text("But that's okay, because challenges help us grow stronger than before.")
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .frame(width: 270.0)
                
                VStack{
                    Button {
                        isView2Active = true
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 80)
                        .padding(.vertical, 10)
                        .background(Color("Chinese Orange"))
                        .foregroundColor(Color.white)
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Axolotl"), lineWidth: 1)
                            
                        )
                        .overlay{
                            NavigationLink(destination: ObstaclesView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                
                            }
                        }
                }
                    Button {
                        
                    }
                label: {
                    Text("Save for Later")
                        .padding(.horizontal, 80)
                        .padding(.vertical, 10)
                        .background(Color("Chinese Orange"))
                        .foregroundColor(Color.white)
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Axolotl"), lineWidth: 1)
                            
                        )
                }
                }
                .padding(.top, 40.0)
            }
        }
    }
}

struct AfterGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AfterGoalView()
    }
}
