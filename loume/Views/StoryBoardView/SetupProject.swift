//
//  ContentView.swift
//  loume
//
//  Created by Yohan Wijaya on 03/07/23.
//

import SwiftUI
struct SetupProject: View {
//    @State var moveUp = true
//    @State var moveUpCircle = true
//    @State var moveUpText = true
//    @State var isView2Active = false
//    @State var moveUpTextField = true
//    @State var fadeText1 = false
//    @State var offset = CGSize.zero
//    @State var fadeText2 = false
//    @State var fadeOutCircle:Double = 1
//    @State var text1:Double = 90
//    @State var name:String = ""
//    @State var scale2:Double = 1
    
    @State var moveUp: Bool
    @State var moveUpCircle: Bool
    @State var moveUpText: Bool
    @State var isView2Active: Bool
    @State var moveUpTextField: Bool
    @State var fadeText1: Bool
    @State var offset: CGSize
    @State var fadeText2: Bool
    @State var fadeOutCircle:Double
    @State var text1:Double
    @State var name:String
    @State var scale2:Double
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
//    init() {
//        UINavigationBar.setAnimationsEnabled(false)
//    }
    
    var body: some View {
        NavigationView {
            //-------------- Tulisan Atas -------------- //
            VStack {
                VStack {
                    Text("Hi there!")
                        .fontWeight(.bold)
                        .opacity(fadeText1 ? 1 : 0)
                        .animation(.easeIn(duration: 1))
                        .onAppear {
                            withAnimation {
                                fadeText1 = true
                            }
                        }
                    
                    Text("It’s a good day to see you here!")
                        .fontWeight(.bold)
                        .opacity(fadeText2 ? 1 : 0)
                        .animation(.easeIn(duration: 1))
                        .onAppear {
                            withAnimation {
                                fadeText2 = true
                            }
                        }
                }
                .padding(.top,100)
                
                //-------------- Card Bawah -------------- //
                ZStack {
                    Path { path in
                        path.move(to: CGPoint(x: 430, y: 300))
                        path.addQuadCurve(to: CGPoint(x:0, y:300 ), control: CGPoint(x: 190, y: 210))
                        path.addQuadCurve(to: CGPoint(x:0, y:1850 ), control: CGPoint(x: 0, y: 550))
                        path.addQuadCurve(to: CGPoint(x:430, y:1850 ), control: CGPoint(x: 200, y: 1850))
                        path.closeSubpath()
                    }
                    .fill(Color("Light Moss Green"))
                    .offset(x: 0, y: moveUp ? 610 : -100)
                    .animation(Animation.easeInOut(duration: 1.5))
                    .onAppear {
                        moveUp.toggle()
                    }
                    VStack {
                        Text("Let's get to know you better..")
                            .font(.title3)
                            .fontWeight(.bold)
                            .offset(x: 0, y: moveUpText ? 610 : -50)
                            .animation(Animation.easeInOut(duration: 1.5))
                            .onAppear {
                                moveUpText.toggle()
                            }
                            .padding(.top, 140.0)
                        
                        TextField("Enter username...", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width:  300)
                            .offset(x: 0, y: moveUpTextField ? 610 : -50)
                            .animation(Animation.easeInOut(duration: 1.5))
                            .onAppear {
                                moveUpTextField.toggle()
                            }
                            .padding(.top, 10.0)
                        
                        Circle()
                            .foregroundColor(Color("Axolotl"))
                            .padding(.top, 160.0)
                            .frame(width: 70.0)
                            .offset(x: 0, y: moveUpCircle ? 610 : -100)
                            .animation(Animation.easeInOut(duration: 1.5))
                            .onAppear {
                                moveUpCircle.toggle()
                            }
                            .opacity(fadeOutCircle)
                            .overlay(
                                NavigationLink(destination: IntroView(  userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                            .offset(y: offset.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        userListCoreDataViewModel.addUserEntity(name: name)
                                        if gesture.translation.height < 0 {
                                            self.offset = gesture.translation
                                        }
                                    }
                                    .onEnded { gesture in
                                        withAnimation {
                                            if gesture.translation.height < -0 {
                                                self.offset = CGSize(width: 0, height: -700)
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                                    isView2Active = true
                                                }
                                                fadeOutCircle = 0
                                            } else {
                                                self.offset = .zero
                                            }
                                        }
                                    }
                            )
                            .animation(.spring())
                    }
                    .padding(.top, text1)
                }
                .offset(y: offset.height)
            }
        }
        .animation(nil)
        .onAppear(perform: {
            UINavigationBar.setAnimationsEnabled(false)
        })
    }
}

struct SetupProject_Previews: PreviewProvider {
    static var previews: some View {
        SetupProject(moveUp: true,
                     moveUpCircle: true,
                     moveUpText: true,
                     isView2Active: false,
                     moveUpTextField: true,
                     fadeText1: false,
                     offset: CGSize.zero,
                     fadeText2: false,
                     fadeOutCircle: 1,
                     text1: 90,
                     name: "",
                     scale2: 1,
                     userListCoreDataViewModel: UserListCoreDataViewModel(),
                     goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                     planListCoreDataViewModel: PlanListCoreDataViewModel(),
                     subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                     loveListCoreDataViewModel: LoveListCoreDataViewModel())
    }
}
