//
//  obstaclesView.swift
//  LocalLoumeStory
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct ObstaclesView: View {
    @State var username: String = ""
    @State private var disable1 = false
    @State var visible: Double = 1
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    @State var hideButton: Double = 1

    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    VStack{
                        Text("Let’s figure out what can stop you from achieving your goals? ")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .padding(.top, 40)
                        HStack{
                            
                            Circle()
                                .padding(.leading)
                                .frame(width: 130.0, height: 130.0)
                                .foregroundColor(Color("Light Moss Green"))
                                .overlay{
                                    Text("Your Goal")
                                        .font(.body)
                                        .padding(.leading)
                                }
                            
                            Path { path in
                                path.move(to: CGPoint(x: 170, y: 285))
                                path.addQuadCurve(to: CGPoint(x:-10, y:140 ), control: CGPoint(x: 300, y: 160))
                                
                            }
                            .stroke(style: StrokeStyle( lineWidth: 2, dash: [5]))
                            .stroke(Color("Light Moss Green"))
                        }
                        .frame(height: 280.0)
                        HStack{
                            Spacer()
                            VStack{
                                Text("What's your biggest fear when you want to be a choreographer?")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 29.0)
                                    .frame(width: 250.0)
                                TextField("Enter username...", text: $username)
                                    .padding(.trailing, 29)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width:  250)
                            }
                            
                        }
                        Path { path in
                            path.move(to: CGPoint(x: 200, y: 0))
                            path.addQuadCurve(to: CGPoint(x:60, y:350 ), control: CGPoint(x: 10, y: 160))
                            
                        }
                        .stroke(style: StrokeStyle( lineWidth: 2, dash: [5]))
                        .stroke(Color("Light Moss Green"))
                        
                        
                        
                        
                    }
                    .frame(height:860.0)
                    
                    HStack{
                        VStack{
                            Text("What’s your biggest blocker when it comes to realizing that dream?")
                                .font(.footnote)
                                .frame(width: 250.0)
                            Text("e.g. lack of skills, budget, time, etc.")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .padding(.trailing, 20)
                            TextField("Enter username...", text: $username)
                                .padding(.leading)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width:  250)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading, 29)
                    HStack{
                        VStack{
                            Path { path in
                                path.move(to: CGPoint(x: 80, y: -5))
                                path.addQuadCurve(to: CGPoint(x:260, y:100 ), control: CGPoint(x: 100, y: 50))
                                
                            }
                            .stroke(style: StrokeStyle( lineWidth: 2, dash: [5]))
                            .stroke(Color("Light Moss Green"))
                        }
                        .frame(height: 70.0)
                        
                    }
                    Circle()
                        .frame(width: 120.0)
                        .padding(.leading, 220)
                        .foregroundColor(Color("Light Moss Green"))
                        .overlay{
                            Text("You Are Here")
                                .padding(.leading, 220)
                        }
                    
                    Text("Did you know that you’re one step ahead of overcoming your challenges because you are aware of the obstacles?")
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0)
                        .padding(.top, 80)
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
                        
                    }.padding(.top , 70)
                }
            }
            
        }
    }
}

struct ObstaclesView_Previews: PreviewProvider {
    static var previews: some View {
        ObstaclesView()
    }
}