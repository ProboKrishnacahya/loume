//
//  interestPromise.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct InterestPromiseView: View {
//    @State var roleModel1: String = ""
//    @State var test0: Double = 1
//    @State var test1: Double = 0
//    @State var test2: Double = 0
//    @State var test3: Double = 0
//    @State var visible: Double = 0
//    @State private var disable1 = false
//    @State var firstPage: Double = 1
//    @State var visibleText1: Double = 0
//    @State var visibleText2: Double = 0
//    @State var visibleText3: Double = 0
//    @State var visibleText4: Double = 0
//    @State var hideButton: Double = 0
    
    @State var roleModel1: String
    @State var test0: Double
    @State var test1: Double
    @State var test2: Double
    @State var test3: Double
    @State var visible: Double
    @State var disable1: Bool
    @State var firstPage: Double
    @State var visibleText1: Double
    @State var visibleText2: Double
    @State var visibleText3: Double
    @State var visibleText4: Double
    @State var hideButton: Double
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel

    var body: some View {
        ZStack{
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
                                firstPage = 1
                                visibleText1 = 0
                                hideButton = 0
                                
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
                                visibleText1 = 0
                                visibleText2 = 1
                                
                                
                            }
                    }
                    
                    
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
                                
                                visibleText1 = 1
                                visibleText2 = 0
                            }
                        
                        Spacer()
                        HStack{
                            Text("1")
                                .font(.callout)
                            Text("of")
                                .font(.callout)
                            Text("2")
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
                                visibleText3 = 0
                                visibleText2 = 1
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
                    .opacity(visibleText3) //end
                    
                }
                .opacity(hideButton)
            }
            ZStack{
                VStack{
                    Text("Look at how you figure out your strengths and weaknesses! Means that you know yourself more than you think you do!")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                    Button {
                        
                        visibleText1 = 1
                        visible = 1
                        hideButton = 1
                        firstPage = 0
                    }
                label: {
                    Text("Continue Now")
                        .padding(.horizontal, 60)
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
                        .padding(.horizontal, 60)
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
                .opacity(firstPage)
                
                VStack{
                    VStack{
                        HStack{
                            Text("Talking about")
                            Text("Dance")
                                .fontWeight(.bold)
                            
                            //ganti "dance" pada Text baris di atas dengan
                            //loveListCoreDataViewModel.getMostInterest()
                            Text("do you")
                        }
                        Text("have something that you want to achieve in this field?")
                            .multilineTextAlignment(.center)
                            .frame(width: 270.0)
                    }
                    VStack{
                        Text("I Want To..")
                        VStack{
                            TextEditor(text: $roleModel1)
                                .frame(width: 260.0, height: 30.0)
                                .navigationTitle("About you")
                                .padding(.all)
                            
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Axolotl"), lineWidth: 2)
                            
                            //jika tombol oren diklik: tujuannya untuk memasukkan goal ke dalam data
        //                    userListCoreDataViewModel.setRoleModel(userCoreDataModel: userListCoreDataViewModel.userEntities[0], roleModel: {{isikan disini nama role modelnya}})
                        )
                        
                    }
                    .padding(.top, 100)
                    Text("Ex: I want to be a singer / I want to work as an accountant  / I want to open a business ( Please be as specific as you can)")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5.0)
                        .frame(width: 300.0)
                    Spacer()
                }.onAppear{
                                   }
                .padding(.top, 130)
                .opacity(visibleText1)
                
                VStack{
                    Text("Great one! You want to be a")
                    Text("choreographer")
                        .fontWeight(.bold)
                    Text("You can achieve it if you believe in yourself and start to act on it.")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                }
                .opacity(visibleText2)
                
                VStack{
                    Text("Sometimes achieving our goals is not that easy because there are challenges we may face.")
                        .multilineTextAlignment(.center)
                        .frame(width: 270.0)
                    
                    Text("But that's okay, because challenges help us grow stronger than before.")
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .frame(width: 270.0)
                    VStack{
                        Button {
                            
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
                    .padding(.top, 40.0)
                    
                }
                .opacity(visibleText3)
                
                
            }
            
        }
    }
    
}

struct InterestPromiseView_Previews: PreviewProvider {
    static var previews: some View {
        InterestPromiseView(roleModel1: "",
                            test0: 1,
                            test1: 0,
                            test2: 0,
                            test3: 0,
                            visible: 0,
                            disable1: false,
                            firstPage: 1,
                            visibleText1: 0,
                            visibleText2: 0,
                            visibleText3: 0,
                            visibleText4: 0,
                            hideButton: 0,
                            userListCoreDataViewModel: UserListCoreDataViewModel(),
                            goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                            planListCoreDataViewModel: PlanListCoreDataViewModel(),
                            subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                            loveListCoreDataViewModel: LoveListCoreDataViewModel())
    }
}
