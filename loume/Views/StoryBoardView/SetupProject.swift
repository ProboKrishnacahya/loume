//
//  ContentView.swift
//  loume
//
//  Created by Yohan Wijaya on 03/07/23.
//

import SwiftUI
struct SetupProject: View {
    @State private var moveUp = true
    @State private var moveUpCircle = true
    @State private var moveUpText = true
    @State private var isView2Active = false
    @State private var moveUpTextField = true
    @State private var fadeText1 = false
    @State private var offset = CGSize.zero
    @State private var fadeText2 = false
    @State private var fadeOutCircle:Double = 1
    @State var text1:Double = 90
    @State var username: String = ""
    @State private var scale2:Double = 1
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
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
                        
                        TextField("Enter username...", text: $username)
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
                                NavigationLink(destination: IntroView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                            .offset(y: offset.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
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
    }
}

struct SetupProject_Previews: PreviewProvider {
    static var previews: some View {
        SetupProject()
    }
}
