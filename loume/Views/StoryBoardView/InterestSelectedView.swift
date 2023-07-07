//
//  interestSelectedView.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct InterestSelectedView: View {
    @State var visible: Double = 1
    @State private var disable1 = false
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    @State var hideButton: Double = 1
    var body: some View {
        ZStack{
            VStack{
                Text("Which interests do you think will ")
                    .fontWeight(.semibold)
                Text("influence your life in the future? ")
                    .fontWeight(.semibold)
                ZStack{
                    Circle()
                        .inset(by: 8)
                        .stroke(Color("Light Moss Green"), lineWidth: 3)
                        .frame(width: 165.0, height: 165.0)
                    
                    
                    Circle()
                        .frame(width: 140.0)
                        .foregroundColor(Color("Axolotl"))
                        .overlay{
                            Text("Dance")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                    
                    
                }
                ZStack{
                    Circle()
                        .inset(by: 8)
                        .stroke(Color("Light Moss Green"), lineWidth: 3)
                        .frame(width: 165.0, height: 165.0)
                    
                    
                    Circle()
                        .frame(width: 140.0)
                        .foregroundColor(Color("Axolotl"))
                        .overlay{
                            Text("Dance")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                    
                }
                ZStack{
                    Circle()
                        .inset(by: 8)
                        .stroke(Color("Light Moss Green"), lineWidth: 3)
                        .frame(width: 165.0, height: 165.0)
                    
                    
                    Circle()
                        .frame(width: 140.0)
                        .foregroundColor(Color("Axolotl"))
                        .overlay{
                            Text("Dance")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                }
                
                
                Text("Order the interests based on its impact.")
                    .padding(.top, 20)
                    .frame(height: 30.0)
            }
            .padding(.bottom, 50)
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

struct InterestSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        InterestSelectedView()
    }
}
