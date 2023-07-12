//
//  similarStrengthYes.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthYes: View {
    @State var roleModel1: String = ""
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Cool! Please mention one")
                        .font(.title2)
                    Text("similarity between you and")
                        .font(.title2)
                    Text(userListCoreDataViewModel.userEntities[0].roleModel)
                        .fontWeight(.bold)
                        .font(.title2)
                }
                
                TextField("Strength or speciality...", text: $roleModel1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:  290)
                    .animation(Animation.easeInOut(duration: 1.5))
                    .padding(.top, 20)
             
                //                    userListCoreDataViewModel.setStrengthSimilar(userCoreDataModel: userListCoreDataViewModel.userEntities[0], strengthSimilar: {{isikan disini strength similarnya}})
            }
        }
    }
}

struct SimilarStrengthYes_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthYes(userListCoreDataViewModel: UserListCoreDataViewModel(),
                           goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                           planListCoreDataViewModel: PlanListCoreDataViewModel(),
                           subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                           loveListCoreDataViewModel: LoveListCoreDataViewModel(), roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel())
    }
}
