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
    @State private var isView2Active = false

    
    
    @State var circle1 : Double = 0
    @State var circle2 : Double = 0
    @State var circle3 : Double = 0
    
    
    
    
    
//    @State var visible: Double
//    @State var disable1: Bool
//    @State var visibleText2: Double
//    @State var visibleText3: Double
//    @State var visibleText4: Double
//    @State var visibleText5: Double
//    @State var hideButton: Double
//    @State var isView2Active: Bool
    
    // di bawah ini harus ada di setiap page story board dan cara lemparnya sama seperti sebelumnya ini
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
    var body: some View {
        NavigationView{
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
                            .opacity(circle1)
                        
                        
                        Circle()
                            .frame(width: 140.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text(loveListCoreDataViewModel.loveEntities[0].name)
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                            }
                        
                        
                        //code di bawah ini harus ada di dalam foreach
                        //                    loveListCoreDataViewModel.setRank(loveCoreDataModel: interest, rank: rank)
                        
                        //code untuk dapat label rank untuk masing2 3 interest
                        //                    interest.rank
                    }
                    .onTapGesture {
                        circle1 = 1
                        circle2 = 0
                        circle3 = 0
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[0], rank: 1)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[1], rank: 2)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[2], rank: 3)
                    }
                    
                    //code di bawah ini ga dipakai karena data diambil dari core data dan sudah dilopping di atas
                    ZStack{
                        Circle()
                            .inset(by: 8)
                            .stroke(Color("Light Moss Green"), lineWidth: 3)
                            .frame(width: 165.0, height: 165.0)
                            .opacity(circle2)
                        
                        
                        Circle()
                            .frame(width: 140.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text(loveListCoreDataViewModel.loveEntities[1].name)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                        
                        
                        
                        
                    }
                    .onTapGesture {
                        circle1 = 0
                        circle2 = 1
                        circle3 = 0
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[1], rank: 1)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[0], rank: 2)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[2], rank: 3)
                    }
                    
                    ZStack{
                        Circle()
                            .inset(by: 8)
                            .stroke(Color("Light Moss Green"), lineWidth: 3)
                            .frame(width: 165.0, height: 165.0)
                            .opacity(circle3)
                        
                        
                        Circle()
                            .frame(width: 140.0)
                            .foregroundColor(Color("Axolotl"))
                            .overlay{
                                Text(loveListCoreDataViewModel.loveEntities[2].name)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }
                    .onTapGesture {
                        circle1 = 0
                        circle2 = 0
                        circle3 = 1
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[2], rank: 1)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[1], rank: 2)
                        loveListCoreDataViewModel.setRank(loveCoreDataModel: loveListCoreDataViewModel.loveEntities[0], rank: 3)
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
                                Text("2")
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
                                    
                                    isView2Active = true
                                    
                                }
                                .overlay(
                                    NavigationLink(destination: RoleModelView(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                        EmptyView()
                                    }
                                )
                                    
                                
                        }
                        .opacity(visible)
                        
                        
                        //                            .overlay(
                        //                                NavigationLink(destination: InterestView(visible: 1, visibleText2: 0, visibleText3: 0, visibleText4: 0, visibleText5: 0, hideButton: 1, fadeText1: false, disable1: false, disable2: false, isView2Active: false, isVisible: false, angle: 0.0, scalefade: 1.0, scale: 1.0, rotation: 0.0, rotationIntro: false, flip: false, selectedCircles: [], rotate1: [], userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                        //                                    EmptyView()
                        //                                }
                        //                            )
                        
                    }
                    .opacity(hideButton)
                }
            }
        }
    }
}

struct InterestSelectedView_Previews: PreviewProvider {
    
    static var previews: some View {
        InterestSelectedView(
                             userListCoreDataViewModel: UserListCoreDataViewModel(),
                             goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                             planListCoreDataViewModel: PlanListCoreDataViewModel(),
                             subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                             loveListCoreDataViewModel: LoveListCoreDataViewModel())
    }
}
