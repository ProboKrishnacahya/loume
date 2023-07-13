//
//  confidentView.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI
let width = UIScreen.main.bounds.width

struct ConfidentView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    
    @State var maxWidth: CGFloat = width - 32
    @State var sliderProgress: CGFloat = 0
    @State var sliderWidth: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    @State var visible: Double = 1
    @State private var disable1 = false
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    @State var hideButton: Double = 1
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("How confident are you to be")
                            .font(.title3)
                        
                        HStack{
                            Text("able to")
                                .font(.title3)
                            
                            if goalListCoreDataViewModel.goalEntities.count > 0 {
                                
                                Text(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                            }
                        }
                        
                        Text("after doing this reflection journey?")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .frame(width: 330)
                    }
                    HStack{
                        VStack {
                            ZStack(alignment: .leading, content: {
                                Rectangle()
                                    .fill(Color("Axolotl").opacity(0.1))
                                
                                Rectangle()
                                    .fill(Color("Axolotl"))
                                    .frame(width: sliderWidth)
                            })
                            .frame(width: maxWidth, height: 150)
                            .cornerRadius(5)
                            
                            .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                                
                                let translation = value.translation
                                
                                sliderWidth = translation.width + lastDragValue
                                
                                sliderWidth = sliderWidth > maxWidth ? maxWidth : sliderWidth
                                
                                sliderWidth = sliderWidth >= 0 ? sliderWidth : 0
                                
                                let progress = sliderWidth / maxWidth
                                
                                sliderProgress = progress <= 1.0 ? progress : 1
                                
                            }).onEnded({ (value) in
                                
                                sliderWidth = sliderWidth > maxWidth ? maxWidth : sliderWidth
                                
                                // Negative Height....
                                sliderWidth = sliderWidth >= 0 ? sliderWidth : 0
                                
                                lastDragValue = sliderWidth
                                
                            }))
                        }
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200.0, height: 450.0)
                        
                        Image("ConfidentView-1")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Text("Fill the confidence bar")
                    
                    Text("\(Int(sliderProgress * 100))%")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }.padding(.bottom ,30)
                    .opacity(visible)
                
                VStack{
                    Text("Actually, you should be more")
                        .font(.title3)
                    
                    HStack{
                        Text("confident")
                            .font(.title3)
                        
                        Text(userListCoreDataViewModel.userEntities[0].name)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .opacity(visibleText2)
                
                VStack{
                    Text("Fun fact!")
                        .font(.title3)
                    
                    Text("You can increase your success ")
                        .font(.title3)
                    
                    HStack{
                        Text("to")
                            .font(.title3)
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            
                            Text(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                        }
                        
                        Text("by a")
                            .font(.title3)
                    }
                    
                    Text("whopping 1.150% because")
                        .font(.title3)
                    
                    Text("you have listed an intentional")
                        .font(.title3)
                    
                    HStack{
                        Text("set of action steps")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("to achieve")
                            .font(.title3)
                    }
                    
                    Text("your goals.")
                        .font(.title3)
                }
                .opacity(visibleText3)
                
                VStack{
                    Spacer()
                    
                    Text("So… are you done? Not yet, Audrey. Don’t forget, this is the beginning of an exciting journey towards your dream!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                    
                    VStack{
                        Text("Are you ready to ")
                            .font(.title3)
                        
                        if goalListCoreDataViewModel.goalEntities.count > 0 {
                            
                            Text(goalListCoreDataViewModel.goalEntities[goalListCoreDataViewModel.goalEntities.count-1].name)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                        }
                    }
                    .padding(.top, 50)
                    
                    VStack{
                        Button {
                            hideButton = 0
                            visibleText4 = 0
                            visibleText5 = 1
                        }
                    label: {
                        Text("DEFINITELY YES !")
                            .padding(.horizontal, 50)
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
                    Spacer()
                }
                .opacity(visibleText4)
                .padding(.top, 10)
                
                VStack{
                    Text("Oh don’t worry, we’re in this together!")
                    
                    VStack{
                        Image("ConfidentView-2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 72)
                            .opacity(visibleText5)
                    }
                    .onTapGesture {
                        userListCoreDataViewModel.setIsJournaling()
                        userListCoreDataViewModel.setIsJournalingFinished()
                    }
                }
                
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
                            .foregroundColor(sliderProgress == 0 ? .gray : Color("Chinese Orange"))
                            .overlay{
                                Image(systemName: "arrow.right")
                                    .padding(.trailing)
                                    .foregroundColor(Color.white)
                            }
                            .onTapGesture {
                                visible = 0
                                visibleText2 = 1
                            }
                            .disabled(sliderProgress == 0)
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
    
    struct ConfidentView_Previews: PreviewProvider {
        static var previews: some View {
            ConfidentView()
                .environmentObject(UserListCoreDataViewModel())
                .environmentObject(GoalListCoreDataViewModel())
        }
    }
}
