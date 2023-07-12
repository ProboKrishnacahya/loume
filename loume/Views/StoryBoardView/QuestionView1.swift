//
//  Question1View.swift
//  loume
//
//  Created by Yohan Wijaya on 05/07/23.
//

import SwiftUI

struct QuestionView1: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State private var delayOut1: Double = 1
    @State private var delayOut2: Double = 1
    @State private var delayOut3: Double = 1
    @State private var fadeOutQuestion1 = false
    @State private var fadeOutQuestion2 = false
    @State private var fadeOutQuestion3 = false
    @State private var disable1 = false
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    @State var hideButton: Double = 1
    @State var visible: Double = 1
    @State var Quest1: Double = 1
    @State var Quest2: Double = 0
    @State var Quest3: Double = 0
    @State var condition1: Double = 0
    @State var condition2: Double = 0
    @State var condition3: Double = 0
    @State var nav1: Double = 1
    @State var nav2: Double = 0
    @State var nav3: Double = 0
    @State private var isView2Active = false
    @State private var isView3Active = false
    @State var strength1: String = ""
    @State var strength2: String = ""
    @State var strength3: String = ""
    @State var isStrengthFulled: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        VStack{
                            VStack{
                                Text("What makes you proud of being you?")
                                    .fontWeight(.medium)
                                Text("Here’s some guidance to help you figure it out.")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 50.0)
                                
                                ZStack{
                                    VStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 320.0, height: 450.0)
                                                .cornerRadius(7)
                                                .foregroundColor(Color("Light Moss Green"))
                                            
                                            VStack{
                                                Text("What skills are you good at?")
                                                    .fontWeight(.medium)
                                                
                                                ZStack{
                                                    Rectangle()
                                                        .frame(width: 290.0, height: 360.0)
                                                        .cornerRadius(7)
                                                        .foregroundColor(Color.white)
                                                    TextEditor(text: $strength1)
                                                        .frame(width: 260.0, height: 350.0)
                                                    
                                                }
                                            }.padding(.top ,10)
                                        }.padding(.top, 20)
                                        
                                        HStack{
                                            Button {
                                                Quest1 = 0
                                                Quest2 = 1
                                                nav1 = 0
                                                nav2 = 1
                                            }
                                        label: {
                                            Text("I don’t know")
                                                .padding(.horizontal, 115)
                                                .padding(.vertical, 10)
                                                .foregroundColor(Color("Axolotl"))
                                                .tint(Color.red)
                                                .buttonStyle(.bordered)
                                                .background(
                                                    
                                                    RoundedRectangle(
                                                        cornerRadius: 5,
                                                        style: .continuous
                                                    )
                                                    .stroke(Color("Axolotl"), lineWidth: 1)
                                                    
                                                )
                                        }
                                        }.padding(.top,10)
                                    }
                                }
                            } .opacity(Quest1)
                        }
                        
                        VStack{
                            VStack{
                                Text("What makes you proud of being you?")
                                    .fontWeight(.medium)
                                Text("Here’s some guidance to help you figure it out.")
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 50.0)
                                ZStack{
                                    VStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 320.0, height: 450.0)
                                                .cornerRadius(7)
                                                .foregroundColor(Color("Light Moss Green"))
                                            
                                            VStack{
                                                Text("Give me an example of something you did to improve yourself?")
                                                    .font(.subheadline)
                                                    .fontWeight(.medium)
                                                    .multilineTextAlignment(.center)
                                                    .frame(width: 300.0)
                                                
                                                ZStack{
                                                    Rectangle()
                                                        .frame(width: 290.0, height: 350.0)
                                                        .cornerRadius(7)
                                                        .foregroundColor(Color.white)
                                                    TextEditor(text: $strength2)
                                                        .frame(width: 260.0, height: 350.0)
                                                    
                                                }
                                            }.padding(.top ,10)
                                        }.padding(.top, 20)
                                        
                                        HStack{
                                            Button {
                                                Quest2 = 0
                                                Quest3 = 1
                                                nav2 = 0
                                                nav3 = 1
                                            }
                                        label: {
                                            Text("I don’t know")
                                                .padding(.horizontal, 115)
                                                .padding(.vertical, 10)
                                                .foregroundColor(Color("Axolotl"))
                                                .tint(Color.red)
                                                .buttonStyle(.bordered)
                                                .background(
                                                    
                                                    RoundedRectangle(
                                                        cornerRadius: 5,
                                                        style: .continuous
                                                    )
                                                    .stroke(Color("Axolotl"), lineWidth: 1)
                                                    
                                                )
                                        }
                                        }.padding(.top,10)
                                    }
                                }
                            }
                            .opacity(Quest2)
                        }
                        
                        VStack{
                            Text("What makes you proud of being you?")
                                .fontWeight(.medium)
                            Text("Here’s some guidance to help you figure it out.")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 50.0)
                            ZStack{
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 320.0, height: 450.0)
                                            .cornerRadius(7)
                                            .foregroundColor(Color("Light Moss Green"))
                                        
                                        VStack{
                                            Text("What kind of compliments do you receive most often? (at your workplace/school/ family)")
                                                .fontWeight(.medium)
                                                .font(.subheadline)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 300.0)
                                            
                                            ZStack{
                                                Rectangle()
                                                    .frame(width: 290.0, height: 345.0)
                                                    .cornerRadius(7)
                                                    .foregroundColor(Color.white)
                                                TextEditor(text: $strength3)
                                                    .frame(width: 260.0, height: 345.0)
                                                
                                            }
                                        }.padding(.top ,10)
                                    }.padding(.top, 20)
                                    
                                    HStack{
                                        Button {
                                            
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
                                            
                                            isView2Active = true
                                        }
                                    label: {
                                        Text("I don’t know")
                                            .padding(.horizontal, 115)
                                            .padding(.vertical, 10)
                                            .foregroundColor(Color("Axolotl"))
                                            .tint(Color.red)
                                            .buttonStyle(.bordered)
                                            .background(
                                                
                                                RoundedRectangle(
                                                    cornerRadius: 5,
                                                    style: .continuous
                                                )
                                                .stroke(Color("Axolotl"), lineWidth: 1)
                                                
                                            )
                                            .overlay(
                                                NavigationLink(destination: AfterQuestion1View(condition1: $condition1, condition2: $condition2, condition3: $condition3, isStrengthFulled: $isStrengthFulled).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                                    EmptyView()
                                                }
                                            )
                                    }
                                    }.padding(.top,10)
                                }
                            }
                        }
                        .opacity(Quest3)
                    }
                }
                .padding(.bottom, 60)
                
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
                                    isView3Active = true
                                }
                                .overlay(
                                    NavigationLink(destination: RoleModelSimilarStrengthView().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
                                        EmptyView()
                                    }
                                )
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
                                    Quest1 = 0
                                    Quest2 = 1
                                    nav1 = 0
                                    nav2 = 1
                                    
                                    userListCoreDataViewModel.setStrength1(strength: strength1)
                                }
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
                                    Quest1 = 1
                                    Quest2 = 0
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
                                    Quest2 = 0
                                    Quest3 = 1
                                    nav2 = 0
                                    nav3 = 1
                                    
                                    userListCoreDataViewModel.setStrength2(strength: strength2)
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
                                    Quest2 = 1
                                    Quest3 = 0
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
                                .onTapGesture {
                                    
                                    userListCoreDataViewModel.setStrength3(strength: strength3)
                                    
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
                                    
                                    isView2Active = true
                                }
                                .overlay(
                                    NavigationLink(destination: AfterQuestion1View(condition1: $condition1, condition2: $condition2, condition3: $condition3, isStrengthFulled: $isStrengthFulled).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                        EmptyView()
                                    }
                                )
                        }
                        .opacity(nav3)
                    }
                    .opacity(hideButton)
                }
            }
        }
    }
}

struct QuestionView1_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView1()
            .environmentObject(UserListCoreDataViewModel())
    }
}
