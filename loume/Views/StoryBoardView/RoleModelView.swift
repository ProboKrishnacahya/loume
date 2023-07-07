//
//  roleModel.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct RoleModelView: View {
    @State private var movePage1: Double  = 1
    @State private var movePage2: Double  = 0
    @State private var movePage3: Double  = 0
    @State var roleModel1: String = ""
    @State var roleModel2: String = ""
    @State var roleModel3: String = ""
    @State private var fadeText1 = false
    @State private var disable1 = false
    @State var roleModel: String = ""
    
    @State var visible: Double = 1
    
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    @State var hideButton: Double = 0
    
    var body: some View {
        ZStack{
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea([.all])
                VStack{
                    VStack{
                        Text("Wow, that's cool! You have so")
                        HStack{
                            Text("much potential in")
                                .multilineTextAlignment(.center)
                            Text("dance")
                        }
                        Text("Now let’s get a little bit")
                        HStack{
                            Text("Deeper about")
                            Text("dance.")
                                .fontWeight(.bold)
                        }
                        Button {
                            movePage1 = 0
                            movePage2 = 1
                            hideButton = 1
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
                    }
                        Button {
                            
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
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(1))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                    
                }
                .opacity(movePage1)
                
                VStack{
                    VStack{
                        VStack{
                            Text("Can you name someone ")
                            HStack{
                                Text("specifically in the")
                                Text("dance") // Di isi data
                                    .fontWeight(.bold)
                                Text("field")
                            }
                            Text("that you adore so much ?")
                            Text(" ")
                            Text("It could be a famous person,")
                            Text("professionals, or people you")
                            HStack{
                                Text("know who is expert in")
                                Text("dance") // Di isi data
                                    .fontWeight(.bold)
                            }
                        }
                        TextField("Enter username...", text: $roleModel)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width:  250)
                            .animation(Animation.easeInOut(duration: 1.5))
                            .padding(.top, 10.0)
                    }
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                }
                .opacity(movePage2)
                VStack{
                    VStack{
                        HStack{
                            Text("Mark Lee")
                                .fontWeight(.bold)
                            Text("huh? Seems like a very")
                        }
                        Text("cool person!")
                        HStack{
                            Text("Why are you inspired by")
                            Text("Mark Lee?")
                                .fontWeight(.bold)
                        }
                    }
                    VStack{
                        VStack{
                            Text("Can you mention some of their strengths or expertise?")
                                .multilineTextAlignment(.center)
                            HStack{
                                Circle()
                                    .frame(width: 30.0)
                                    .foregroundColor(Color("Axolotl"))
                                    .overlay{
                                        Text("1")
                                            .foregroundColor(Color.white)
                                    }
                                TextField("Enter username...", text: $roleModel1)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                    .frame(width:  250)
                                    .animation(Animation.easeInOut(duration: 1.5))
                            }.padding(.top)
                            HStack{
                                Circle()
                                    .frame(width: 30.0)
                                    .foregroundColor(Color("Axolotl"))
                                    .overlay{
                                        Text("2")
                                            .foregroundColor(Color.white)
                                    }
                                TextField("Enter username...", text: $roleModel2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                    .frame(width:  250)
                                    .animation(Animation.easeInOut(duration: 1.5))
                            }
                            .padding(.top, 5)
                            HStack{
                                Circle()
                                    .frame(width: 30.0)
                                    .foregroundColor(Color("Axolotl"))
                                    .overlay{
                                        Text("3")
                                            .foregroundColor(Color.white)
                                    }
                                TextField("Enter username...", text: $roleModel2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                    .frame(width:  250)
                                    .animation(Animation.easeInOut(duration: 1.5))
                            }
                            .padding(.top, 5)
                            
                        }
                        
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                        
                    }
                    .background(Color("Light Moss Green"))
                    .cornerRadius(20)
                    
                }
                .opacity(movePage3)
            
            }
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
                                movePage2 = 0
                                movePage3 = 1
                                
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
                                
                                visibleText3 = 0
                                visibleText4 = 1
                            }
                    }
                    .opacity(visibleText3)
                    
                }
                .opacity(hideButton)
            }
        }
        
    }
}

struct RoleModelView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelView()
    }
}
