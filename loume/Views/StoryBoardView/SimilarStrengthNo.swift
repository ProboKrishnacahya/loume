//
//  similarStrenghtNo.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthNo: View {
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @ObservedObject var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        NavigationView {
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
