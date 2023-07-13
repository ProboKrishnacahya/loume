//
//  afterObstacleView.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct AfterObstacleView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    
    @State var visible: Double = 1
    @State private var disable1 = false
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var hideButton: Double = 1
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                VStack{
                    Text("However, to really achieve your goals, you need a plan!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0)
                    
                    Text("But, why should you plan your goals?")
                        .padding(.top ,40)
                    
                    Button {
                        visible = 0
                        visibleText2 = 1
                    }
                label: {
                    Text("I’m curious, tell me why!")
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
                        visible = 0
                        visibleText2 = 1
                        
                        userListCoreDataViewModel.setIsJournaling()
                    }
                label: {
                    Text("Save for later")
                        .padding(.horizontal, 101)
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
                .opacity(visible)
                
                VStack{
                    Text("By planning the things you need")
                    
                    HStack{
                        Text("to do to")
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            Text("be a \(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Text("you will be much more motivated to pursue it and all your action steps can be more intentional.")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                }
                .opacity(visibleText2)
                
                VStack{
                    Text("Did you know?")
                    
                    Text("Based on the study by Dr. Gail Matthews, a psychology professor at Dominican University in California, you are 42% more likely to be able to ")
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .frame(width: 300.0)
                    
                    HStack{
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            Text("be a \(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)")
                                .fontWeight(.bold)
                        }
                        
                        Text("by writing it")
                    }
                    
                    Text("down and coming up with a plan.")
                    
                }
                .opacity(visibleText3)
                
                VStack{
                    VStack{
                        Text("Here’s how:")
                            .font(.title2)
                        
                        VStack{
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 45))
                            Text("1. Tap on the prompt below")
                                .frame(width: 270.0)
                                .padding(.top, 10)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 50)
                        
                        VStack{
                            Image(systemName: "cursorarrow.click")
                                .font(.system(size: 45))
                            Text("2. you need to achieve your goals")
                                .padding(.top, 10)
                                .multilineTextAlignment(.center)
                            Text("Browse and find anything that")
                                .frame(width: 270.0)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 40)
                        
                        VStack{
                            Image(systemName: "pencil.line")
                                .font(.system(size: 45))
                            Text("3. Come back here and you are ready for your journey!")
                                .frame(width: 200.0)
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                        }
                        .padding(.top, 40)
                    }
                    .opacity(visibleText4)
                    
                    Button(action: {
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            StoryBoardViewModel().openSafari(goal: goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                        }
                        
                    }, label: {
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            Text("How to get ready to be a \(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)?")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50.0)
                                .frame(width: 270.0)
                                .opacity(visibleText4)
                                .foregroundColor(Color("Axolotl"))
                        }
                    })
                }
            }
            
            Spacer()
            
            ZStack{ // button untuk next
                HStack{ //1
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
                            visible = 1
                            visibleText2 = 0
                            visibleText3 = 0
                        }
                    Spacer()
                    HStack{
                        Text("1")
                            .font(.callout)
                        Text("of")
                            .font(.callout)
                        Text("2")
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
                            visible = 0
                            visibleText2 = 0
                            visibleText3 = 1
                        }
                }
                .opacity(visibleText2)
                
                HStack{ // 2
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
                            visible = 0
                            visibleText2 = 1
                            visibleText3 = 0
                        }
                    
                    Spacer()
                    
                    HStack{
                        Text("2")
                            .font(.callout)
                        Text("of")
                            .font(.callout)
                        Text("2")
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
                            hideButton = 0
                            visibleText3 = 0
                            visibleText4 = 1
                        }
                }
                .opacity(visibleText3)
            }
            .opacity(hideButton)
        }
        .padding(.top,50)
    }
}


struct AfterObstacleView_Previews: PreviewProvider {
    static var previews: some View {
        AfterObstacleView()
            .environmentObject(UserListCoreDataViewModel())
            .environmentObject(GoalListCoreDataViewModel())
    }
}
