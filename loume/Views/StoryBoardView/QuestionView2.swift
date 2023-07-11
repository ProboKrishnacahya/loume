//
//  QuestionView2.swift
//  loume
//
//  Created by Yohan Wijaya on 05/07/23.
//

import SwiftUI

struct QuestionView2: View {
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
    @State var roleModel1: String = ""
    var body: some View {
        
                ZStack{
                    VStack{
                        ZStack{
                            VStack{
                                VStack{
                                    
                                    Text("Let’s take a step back for a while and think about the one moment you feel disappointed with yourself. ")
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
                                                    
                                                    Text("What habit makes you feel like you’re only wasting time?")
                                                        .font(.subheadline)
                                                        .fontWeight(.medium)
                                                        .multilineTextAlignment(.center)
                                                        .frame(width: 300.0)
                                                    
                                                    ZStack{
                                                        Rectangle()
                                                            .frame(width: 290.0, height: 360.0)
                                                            .cornerRadius(7)
                                                            .foregroundColor(Color.white)
                                                        TextEditor(text: $roleModel1)
                                                            .frame(width: 260.0, height: 350.0)
                                                            .navigationTitle("About you")
                                                    }
                                                }.padding(.top ,10)
                                            }.padding(.top, 20)
                                            
                                            
                                            HStack{
                                                Button {
                                                    fadeOutQuestion1 = false
                                                    fadeOutQuestion2 = true
                                                    delayOut1 = 0.5
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
                                } .opacity(fadeOutQuestion1 ? 1 : 0)
                                    .animation(.easeIn(duration: delayOut1))
                                    .onAppear {
                                        withAnimation {
                                            fadeOutQuestion1 = true
                                        }
                                    }
                                
                                
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
                                                    
                                                    Text("What situations can lead to stress when you’re working?")
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
                                                            .navigationTitle("About you")
                                                    }
                                                }.padding(.top ,10)
                                            }.padding(.top, 20)
                                            
                                            
                                            HStack{
                                                Button {
                                                    fadeOutQuestion2 = false
                                                    fadeOutQuestion3 = true
                                                    delayOut2 = 0.5
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
                                .opacity(fadeOutQuestion2 ? 1 : 0)
                                .animation(.easeIn(duration: delayOut2).delay(delayOut2))
                                
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
                                                
                                                Text("Imagine a time when you need to do something important. What might make you lose focus?")
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
                                                        .frame(width: 260.0, height: 345.0)
                                                    
                                                }
                                            }.padding(.top ,10)
                                        }.padding(.top, 20)
                                        
                                        
                                        HStack{
                                            Button {
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
                            .opacity(fadeOutQuestion3 ? 1 : 0)
                            .animation(.easeIn(duration: delayOut3).delay(1))
                        }
                    }.padding(.bottom,50)
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
                                        visible = 0
                                        visibleText2 = 1
                                        fadeOutQuestion1 = false
                                        fadeOutQuestion2 = true
                                        delayOut1 = 0.5
                                        
                                    }
                            }
                            .opacity(visible)
                            
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
                                        visible = 1
                                        visibleText2 = 0
                                        visibleText3 = 0
                                        
                                        
                                        
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
                                        visible = 0
                                        visibleText2 = 0
                                        visibleText3 = 1
                                        fadeOutQuestion2 = false
                                        fadeOutQuestion3 = true
                                        fadeOutQuestion2 = false
                                        fadeOutQuestion3 = true
                                        delayOut2 = 0.5
                                        
                                    }
                            }
                            .opacity(visibleText2)
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
                                        visible = 0
                                        visibleText2 = 1
                                        visibleText3 = 0
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
                                        
                                        
                                    }
                            }
                            .opacity(visibleText3)
                            
                        }
                        .opacity(hideButton)
                        
                    }
                    //jika tombol oren diklik: tujuannya untuk memasukkan value weakness ke dalam data disetiap page yang muncul 1 kali. action dibawah untuk menyimpan 1 weakness SAJA. function di bawah normalnya dijalankan 3 kali (sesuai dengan jumlah weaknessnya yaitu ada 3)
        //                    userListCoreDataViewModel.setWeakness(userCoreDataModel: userListCoreDataViewModel.userEntities[0], weakness: {{isikan disini weaknessnya berupa String}})
            }
        }
    }


struct QuestionView2_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView2()
    }
}
