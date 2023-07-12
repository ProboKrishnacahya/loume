//
//  afterObstacle2View.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct AfterObstacle2View: View {
    
    @State private var isView2Active = false
    @State private var isView3Active = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("So, did you find what you wanted to find? Let’s get ready to write them down!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                }
                
                VStack{
                    Spacer()
                    HStack{
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
                                NavigationLink(destination: AfterObstacleView().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
                                    EmptyView()
                                }
                            )
                        Spacer()
                        HStack{
                            Text("1")
                                .font(.callout)
                            Text("of")
                                .font(.callout)
                            Text("1")
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
                                NavigationLink(destination: ConfidentView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                }
                            )
                    }
                }
            }
        }
    }
}

struct AfterObstacle2View_Previews: PreviewProvider {
    static var previews: some View {
        AfterObstacle2View()
    }
}
