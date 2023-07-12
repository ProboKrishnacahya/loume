//
//  Question1View.swift
//  loume
//
//  Created by Yohan Wijaya on 05/07/23.
//

import SwiftUI

struct QuestionView1: View {
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
    
    @State var chose1: Double =  0
    @State var chose2: Double =  0
    @State var chose3: Double =  0
    
    @State var Quest1: Double = 1
    @State var Quest2: Double = 0
    @State var Quest3: Double = 0
    
    @State var nav1: Double = 1
    @State var nav2: Double = 0
    @State var nav3: Double = 0
    
    @State private var isView2Active = false
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    @State var roleModel1: String = ""
    
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
                                                    TextEditor(text: $roleModel1)
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
                                                chose1 =  1
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
                                            
                                            
                                        }.padding(.top ,10)
                                    }.padding(.top, 20)
                                    
                                    
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
                                                    TextEditor(text: $roleModel1)
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
                                                chose2 =  1
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
                                                TextEditor(text: $roleModel1)
                                                    .frame(width: 260.0, height: 350.0)
                                                
                                            }
                                        }.padding(.top ,10)
                                    }.padding(.top, 20)
                                    
                                    
                                    HStack{
                                        Button {
                                            chose3 =  1
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
                                    
                                    isView2Active = true
                                    
                                }
                                .overlay(
                                    NavigationLink(destination: AfterQuestion1View(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                        EmptyView()
                                    }
                                )
                        }
                        .opacity(nav3)
                        
                    }
                    .opacity(hideButton)
                }
                
                //jika tombol oren diklik: tujuannya untuk memasukkan value strength ke dalam data disetiap page yang muncul 1 kali. action dibawah untuk menyimpan 1 strength SAJA. function di bawah normalnya dijalankan 3 kali (sesuai dengan jumlah strengthnya yaitu ada 3)
                //                    userListCoreDataViewModel.setStrength(userCoreDataModel: userListCoreDataViewModel.userEntities[0], strength: {{isikan disini strengthnya berupa String}})
            }
        }
    }
}


struct QuestionView1_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView1(userListCoreDataViewModel: UserListCoreDataViewModel(),
                      goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                      planListCoreDataViewModel: PlanListCoreDataViewModel(),
                      subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                      loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
