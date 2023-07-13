//
//  strenghtOut.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct StrengthOut: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State private var isView2Active = false
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    Text("To be honest, I’m sure you")
                    Text("have more strengths than just")
                    
                    HStack{
                        Text("Strength or speciality.")
                            .fontWeight(.bold)
                        Text("Let’s")
                    }
                    
                    Text("figure out some more!")
                    
                }
                .padding(.top ,70)
                
                VStack{
                    Button {
                        isView2Active = true
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 60)
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
                .onTapGesture {
                    
                }
                .overlay{
                    NavigationLink(destination: QuestionView1().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                        EmptyView()
                    }
                }
                    Button {
                        userListCoreDataViewModel.setIsJournaling()
                    }
                label: {
                    Text("Save for Later")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .foregroundColor(Color("Chinese Orange"))
                        .buttonStyle(.bordered)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(Color("Chinese Orange"), lineWidth: 1)
                            
                        )
                }
                }
            }
        }
    }
}

struct StrengthOut_Previews: PreviewProvider {
    static var previews: some View {
        StrengthOut()
    }
}
