//
//  roleModelSimilarStrength.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI


struct RoleModelSimilarStrengthView: View {
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    @State var roleModel1: String = ""
    @State private var isView2Active = false
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Do you have any similar")
                    HStack{
                        Text("strength with")
                        Text("\(userListCoreDataViewModel.userEntities[0].roleModel)?")
                            .fontWeight(.bold)
                        
                    }
                    Rectangle()
                        .frame(width: 270.0, height: 40.0)
                        .cornerRadius(6)
                        .foregroundColor(Color("Axolotl"))
                        .overlay{
                            Text("Yes, of course!!")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                        .onTapGesture {
                            isView2Active = true
                        }
                        .overlay (
                            NavigationLink(destination: SimilarStrengthYes(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                EmptyView()
                            }
                        )
                    Rectangle()
                        .frame(width: 270.0, height: 40.0)
                        .cornerRadius(6)
                        .foregroundColor(Color("Axolotl"))
                        .overlay{
                            Text("No, i’m not sure :(")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                        .onTapGesture {
                            isView2Active = true
                        }
                        .overlay (
                            NavigationLink(destination: SimilarStrengthNo(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel, roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                EmptyView()
                            }
                        )
                }
                
            }
        }
    }
}

struct RoleModelSimilarStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelSimilarStrengthView(userListCoreDataViewModel: UserListCoreDataViewModel(),
                                     goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                                     planListCoreDataViewModel: PlanListCoreDataViewModel(),
                                     subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                                     loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
