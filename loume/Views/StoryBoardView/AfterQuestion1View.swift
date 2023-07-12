//
//  afterQuestion1View.swift
//  loume
//
//  Created by Yohan Wijaya on 07/07/23.
//

import SwiftUI

struct AfterQuestion1View: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State var fadeText: Double = 0
    @State var next: Double = 0
    @State private var isView2Active = false
    
    @Binding var condition1: Double
    @Binding var condition2: Double
    @Binding var condition3: Double
    @Binding var isStrengthFulled: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("Awesome !")
                    Text("Some people don’t really know themselves that much yet, but you do!")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition1 = 0
                        fadeText = 1
                        next = 1
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
                    Button {
                        
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
                .opacity(condition1)
                
                VStack{
                    Text("Cool! You still have plenty of time to explore more about your strengths, take your time!")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition2 = 0
                        fadeText = 1
                        next = 1
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
                    Button {
                        
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
                .opacity(condition2)
                
                VStack{
                    Text("Hmm… having trouble thinking of any? It’s okay! Sometimes it takes some time to realize where our strength lies.")
                        .multilineTextAlignment(.center)
                        .frame(width: 234)
                    Button {
                        condition3 = 0
                        fadeText = 1
                        next = 1
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
                    Button {
                        
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
                .opacity(condition3)
                
                VStack{
                    Text(isStrengthFulled ? "Now that we know your strengths, we also need to be mindful of the opposite; your weaknesses." : "For now, let’s move forward and try to think about the opposite; your weaknesses.")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                }
                .opacity(fadeText)
                
                VStack{
                    Spacer()
                    HStack{ // 1
                        Circle()
                            .frame(width: 80.0)
                            .padding(.leading)
                            .foregroundColor(Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.left")
                                    .padding(.leading)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                next = 0
                                fadeText = 0
                                
                                var sumNullStrength = 0
                                if userListCoreDataViewModel.userEntities[0].strength1.isEmpty {
                                    sumNullStrength += 1
                                }
                                
                                if userListCoreDataViewModel.userEntities[0].strength2.isEmpty {
                                    sumNullStrength += 1
                                }
                                
                                if userListCoreDataViewModel.userEntities[0].strength3.isEmpty {
                                    sumNullStrength += 1
                                }
                                
                                if sumNullStrength == 0 {
                                    condition1 = 1
                                    condition2 = 0
                                    condition3 = 0
                                    isStrengthFulled = true
                                } else if sumNullStrength == 3 {
                                    condition1 = 0
                                    condition2 = 0
                                    condition3 = 1
                                    isStrengthFulled = false
                                } else {
                                    condition1 = 0
                                    condition2 = 1
                                    condition3 = 0
                                    isStrengthFulled = false
                                }
                            }
                        
                        Spacer()
                        
                        HStack{
                            Text("1")
                                .font(.callout)
                            Text("of")
                                .font(.callout)
                            Text("3")
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 80.0)
                            .padding(.trailing)
                            .foregroundColor(Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.right")
                                    .padding(.trailing)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                isView2Active = true
                            }
                            .overlay(
                                NavigationLink(destination: QuestionView2().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                    }
                    .opacity(next)
                }
            }
        }
    }
}

struct AfterQuestion1View_Previews: PreviewProvider {
    static var previews: some View {
        AfterQuestion1View(condition1: .constant(1), condition2: .constant(0), condition3: .constant(0), isStrengthFulled: .constant(true))
            .environmentObject(UserListCoreDataViewModel())
    }
}
