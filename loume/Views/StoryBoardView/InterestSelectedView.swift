//
//  interestSelectedView.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct InterestSelectedView: View {
//    @State var visible: Double = 1
//    @State private var disable1 = false
//    @State var visibleText2: Double = 0
//    @State var visibleText3: Double = 0
//    @State var visibleText4: Double = 0
//    @State var visibleText5: Double = 0
//    @State var hideButton: Double = 1
    
    @State var visible: Double
    @State var disable1: Bool
    @State var visibleText2: Double
    @State var visibleText3: Double
    @State var visibleText4: Double
    @State var visibleText5: Double
    @State var hideButton: Double
    @State var isView2Active: Bool
    
    // di bawah ini harus ada di setiap page story board dan cara lemparnya sama seperti sebelumnya ini
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Text("Which interests do you think will ")
                    .fontWeight(.semibold)
                Text("influence your life in the future? ")
                    .fontWeight(.semibold)
                ForEach (loveListCoreDataViewModel.loveEntities, id: \.id) { interest in
                    ZStack{
                        Circle()
                            .inset(by: 8)
                            .stroke(Color("Light Moss Green"), lineWidth: 3)
                            .frame(width: 165.0, height: 165.0)
                        
                        
                        Circle()
                            .frame(width: 140.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text(interest.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }
                    
                    //code di bawah ini harus ada di dalam foreach
//                    loveListCoreDataViewModel.setRank(loveCoreDataModel: interest, rank: rank)
                    
                    //code untuk dapat label rank untuk masing2 3 interest
//                    interest.rank
                }
                
                //code di bawah ini ga dipakai karena data diambil dari core data dan sudah dilopping di atas
//                ZStack{
//                    Circle()
//                        .inset(by: 8)
//                        .stroke(Color("Light Moss Green"), lineWidth: 3)
//                        .frame(width: 165.0, height: 165.0)
//
//
//                    Circle()
//                        .frame(width: 140.0)
//                        .foregroundColor(Color("Axolotl"))
//                        .overlay{
//                            Text("Dance")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.white)
//                        }
//
//                }
//                ZStack{
//                    Circle()
//                        .inset(by: 8)
//                        .stroke(Color("Light Moss Green"), lineWidth: 3)
//                        .frame(width: 165.0, height: 165.0)
//
//
//                    Circle()
//                        .frame(width: 140.0)
//                        .foregroundColor(Color("Axolotl"))
//                        .overlay{
//                            Text("Dance")
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.white)
//                        }
//                }
                
                
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
//                            .overlay(
//                                NavigationLink(destination: InterestView(visible: 1, visibleText2: 0, visibleText3: 0, visibleText4: 0, visibleText5: 0, hideButton: 1, fadeText1: false, disable1: false, disable2: false, isView2Active: false, isVisible: false, angle: 0.0, scalefade: 1.0, scale: 1.0, rotation: 0.0, rotationIntro: false, flip: false, selectedCircles: [], rotate1: [], userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
//                                    EmptyView()
//                                }
//                            )
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
        InterestSelectedView(visible: 1,
                             disable1: false,
                             visibleText2: 0,
                             visibleText3: 0,
                             visibleText4: 0,
                             visibleText5: 0,
                             hideButton: 1,
                             isView2Active: true,
                             userListCoreDataViewModel: UserListCoreDataViewModel(),
                             goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                             planListCoreDataViewModel: PlanListCoreDataViewModel(),
                             subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                             loveListCoreDataViewModel: LoveListCoreDataViewModel())
    }
}
