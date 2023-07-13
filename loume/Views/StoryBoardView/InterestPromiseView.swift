//
//  interestPromise.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct InterestPromiseView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
    @State var goal: String = ""
    @State var dueDate: Date = Date()
    @State var test0: Double = 1
    @State var test1: Double = 0
    @State var test2: Double = 0
    @State var test3: Double = 0
    @State var visible: Double = 0
    @State private var disable1 = false
    @State var firstPage: Double = 1
    @State var visibleText1: Double = 0
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var hideButton: Double = 0
    @State var page1: Double = 1
    @State var page2: Double = 0
    @State var page3: Double = 0
    @State var page4: Double = 0
    @State var nav1: Double = 0
    @State var nav2: Double = 0
    @State var nav3: Double = 0
    @State private var isView2Active = false
    @Binding var sumNullWeakness: Int
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Spacer()
                    ZStack{ // button untuk next
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
                                    page2 = 0
                                    page1 = 1
                                    hideButton = 0
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
                                .foregroundColor(goal.isEmpty ? .gray : Color("Chinese Orange"))
                                .overlay{
                                    Image(systemName: "arrow.right")
                                        .padding(.trailing)
                                        .foregroundColor(Color.white)
                                }
                                .onTapGesture {
                                    page3 = 1
                                    page2 = 0
                                    nav1 = 0
                                    nav2 = 1
                                    
                                    goalListCoreDataViewModel.addGoalEntity(name: goal, dueDate: dueDate)
                                }
                                .disabled(goal.isEmpty)
                        }
                        .opacity(nav1)
                        
                        HStack{ //2
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
                                    page3 = 0
                                    page2 = 1
                                    nav1 = 1
                                    nav2 = 0
                                }
                            Spacer()
                            HStack{
                                Text("2")
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
                                    page4 = 1
                                    page3 = 0
                                    nav2 = 0
                                    nav3 = 0
                                }
                        }
                        .opacity(nav2)
                        
                        HStack{ // 3
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
                                    page4 = 0
                                    page3 = 1
                                    nav2 = 1
                                    nav3 = 0
                                }
                            Spacer()
                            HStack{
                                Text("3")
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
                        }
                        .opacity(nav3)
                    }
                    .opacity(hideButton)
                }
                
                ZStack{
                    VStack{
                        
                        if sumNullWeakness == 0 {
                            Text("Look at how you figure out your strengths and weaknesses! Means that you know yourself more than you think you do!")
                                .multilineTextAlignment(.center)
                                .frame(width: 270.0)
                        } else if sumNullWeakness == 3 {
                            Text("Can’t seem to think of any? Being able to identify your weaknesses can be a very important skill. Keep going and don’t stop reflecting ☺️")
                                .multilineTextAlignment(.center)
                                .frame(width: 270.0)
                        } else {
                            Text("Keep trying to discover yourself as you learn to develop your strengths and weaknesses.")
                                .multilineTextAlignment(.center)
                                .frame(width: 270.0)
                        }
                        
                        Button {
                            nav1  =  1
                            page2 = 1
                            page1 = 0
                            hideButton = 1
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
                            userListCoreDataViewModel.setIsJournaling()
                        }
                    label: {
                        Text("Save for Later")
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
                    }
                    .opacity(page1)
                    
                    VStack{
                        VStack{
                            HStack{
                                Text("Talking about")
                                
                                Text(loveListCoreDataViewModel.getMostInterest())
                                    .fontWeight(.bold)
                                
                                Text("do you")
                            }
                            
                            Text("have something that you want to achieve in this field?")
                                .multilineTextAlignment(.center)
                                .frame(width: 270.0)
                        }
                        
                        VStack{
                            Text("I Want To..")
                            
                            VStack {
                                TextEditor(text: $goal)
                                    .frame(width: 260.0, height: 30.0)
                                    .padding(.all)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("Axolotl"), lineWidth: 2)
                            )
                        }
                        .padding(.top, 100)
                        
                        VStack {
                            DatePicker("On", selection: $dueDate, in: Date.now..., displayedComponents: .date)
                                .tint(Color("Axolotl"))
                            
                            Spacer()
                            
                            Text("Ex: I want to be a singer / I want to work as an accountant  / I want to open a business ( Please be as specific as you can)")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        .padding(.top, 20.0)
                        .frame(width: 300.0)
                        
                        Spacer()
                    }
                    .onAppear{
                    }
                    .padding(.top, 130)
                    .opacity(page2)
                    
                    VStack{
                        Text("Great one! You want to ")
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            Text(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                                .fontWeight(.bold)
                        }
                        
                        Text("You can achieve it if you believe in yourself and start to act on it.")
                            .multilineTextAlignment(.center)
                            .frame(width: 270.0)
                    }
                    .opacity(page3)
                    
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
                                        EmptyView()
                                    }
                                }
                        }
                            Button {
                                userListCoreDataViewModel.setIsJournaling()
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
                    .opacity(page4)
                }
            }
        }
    }
}

struct InterestPromiseView_Previews: PreviewProvider {
    static var previews: some View {
        InterestPromiseView(sumNullWeakness: .constant(0))
            .environmentObject(UserListCoreDataViewModel())
            .environmentObject(GoalListCoreDataViewModel())
            .environmentObject(LoveListCoreDataViewModel())
    }
}
