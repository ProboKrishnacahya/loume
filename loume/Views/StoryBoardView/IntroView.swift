//
//  introView.swift
//  loume
//
//  Created by Yohan Wijaya on 03/07/23.
//

import SwiftUI

struct IntroView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State private var fadeText1 = false
    @State private var fadeText2 = false
    @State private var isView2Active = false
    @State var stopRepeat = true
    @State private var fadeTextSecond1 = false
    @State private var fadeTextSecond2 = false
    @State private var fadeTextThird1 = false
    @State private var fadeTextThird2 = false
    @State private var disable1 = false
    @State private var disable2 = false
    @State private var disable3 = false
    @State private var scale:Double = 0.8
    @State private var scaleCircleSmall:Double = 1
    @State private var scale2:Double = 1
    @State private var durationHold: Double = 1
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Light Moss Green")
                    .edgesIgnoringSafeArea([.all])
                
                VStack{
                    HStack{
                        Text("Welcome")
                            .fontWeight(.bold)
                        
                        Text(userListCoreDataViewModel.userEntities[0].name)
                            .fontWeight(.bold)
                            .padding(.leading, -3.0)
                        
                    }
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                    
                    VStack{
                        Text("Through this app, you will be guided to do a little journey about yourself. The most important thing in this journey is how ")
                            .multilineTextAlignment(.center)
                            .padding(.top, 5.0)
                            .frame(width: 350.0)
                        Text("you can know yourself better.")
                            .fontWeight(.bold)
                    }
                    .opacity(fadeText2 ? 1 : 0)
                    .animation(.easeIn(duration: 1))
                    .onAppear {
                        withAnimation {
                            fadeText2 = true
                        }
                    }
                }
                .opacity(disable1 ? 0 : 1)
                .animation(.easeIn(duration: 0.5).delay(10))
                .onAppear {
                    withAnimation {
                        disable1 = true
                    }
                }
                
                VStack{
                    VStack {
                        Text("This journey will take approximately around")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        Text("10-15 minutes")
                            .font(.body)
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("Don’t worry, we will be with you and help you know yourself better in an exciting way!")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(11))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                    .padding()
                }
                .opacity(disable2 ? 0 : 1)
                .animation(.easeIn(duration: 1).delay(21))
                .onAppear {
                    withAnimation {
                        disable2 = true
                    }
                }
                
                VStack{
                    Text("Are you ready to discover yourself?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .opacity(fadeText1 ? 1 : 0)
                        .animation(.easeIn(duration: 1).delay(22))
                        .onAppear {
                            withAnimation {
                                fadeText1 = true
                            }
                        }
                    
                    ZStack{
                        Circle()
                            .frame(width: 100.0)
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .scaleEffect(scale)
                            .animation(Animation.easeInOut(duration: durationHold).repeatForever(autoreverses: stopRepeat), value: scale)
                            .onAppear {
                                scale = 1.0
                            }
                            .onTapGesture {
                                scale = 30
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                    isView2Active = true
                                }
                                scale2 = 0
                            }
                            .overlay(
                                NavigationLink(destination: InterestView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                        Circle()
                            .frame(width: 70.0)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .scaleEffect(scale)
                            .animation(Animation.easeInOut(duration: durationHold).repeatForever(autoreverses: stopRepeat), value: scale)
                            .onAppear {
                                scale = 1.0
                            }
                            .onTapGesture {
                                scale = 30
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                    isView2Active = true
                                    isView2Active = true
                                }
                                scale2 = 0
                            }
                            .overlay(
                                NavigationLink(destination: InterestView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                        Circle()
                            .frame(width: 40.0)
                            .foregroundColor(.white)
                            .opacity(1)
                            .scaleEffect(scale)
                            .animation(Animation.easeInOut(duration: durationHold).repeatForever(autoreverses: stopRepeat), value: scale)
                            .onAppear {
                                scale = 1.0
                            }
                            .onTapGesture {
                                scale = 30
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                    isView2Active = true
                                }
                                scale2 = 0
                            }
                            .overlay(
                                NavigationLink(destination: InterestView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                    }
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(23))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                }
            }
        }
        .animation(nil)
        .onAppear(perform: {
            UINavigationBar.setAnimationsEnabled(false)
        })
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .environmentObject(UserListCoreDataViewModel())
    }
}
