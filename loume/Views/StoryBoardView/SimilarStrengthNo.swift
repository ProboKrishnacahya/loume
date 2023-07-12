//
//  similarStrenghtNo.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthNo: View {
    @State var prev: Double = 1
    @State var next: Double = 1
    @State private var isView2Active = false
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Text("It’s okay! I’m sure you can")
                    HStack {
                        Text("attain some of")
                        Text(userListCoreDataViewModel.userEntities[0].roleModel)
                            .fontWeight(.bold)
                    }
                    Text("positive traits one day soon!")
                    Text("For now, let’s try discovering")
                    Text("your strengths.")
                }
                VStack{
                    Spacer()
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
                                isView2Active = true
                            }
                            .overlay{
                                NavigationLink(destination: RoleModelSimilarStrengthView(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                    
                                }
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
                                isView2Active = true
                            }
                            .overlay{
                                NavigationLink(destination: StrengthOut(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                    EmptyView()
                                    
                                }
                            }
                        
                    }
                    .opacity(1)
                }
            }
        }
    }
}

struct SimilarStrengthNo_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthNo(userListCoreDataViewModel: UserListCoreDataViewModel(),
                          goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                          planListCoreDataViewModel: PlanListCoreDataViewModel(),
                          subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                          loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
