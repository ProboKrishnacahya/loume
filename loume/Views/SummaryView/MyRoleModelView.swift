//
//  MyRoleModelView.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyRoleModelView: View {
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Role Model")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
//                        UpdateButton()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("In the design field, I also have a role model and it is..")
                        
                        SummaryResultCard(label: userListCoreDataViewModel.userEntities[0].roleModel)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("is an amazing figure, because..")
                        
                        ForEach(Array(roleModelStrengthListCoreDataViewModel.roleModelStrengthEntities.enumerated()), id: \.0) { index, roleModelStrengthEntitiy in
                            
                            SummaryResultCard(label: "\(index+1). \(roleModelStrengthEntitiy.name)")
                            
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("and it is very cool! because I have similar strengths with \(userListCoreDataViewModel.userEntities[0].roleModel), such as...")
                        
                        SummaryResultCard(label: userListCoreDataViewModel.userEntities[0].strengthSimilar)
                    }
                }
                .padding()
                .foregroundColor(Color("Lotion"))
            }
        }
        .background {
            Image("MyRoleModelView")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MyRoleModelView_Previews: PreviewProvider {
    static var previews: some View {
        MyRoleModelView()
            .environmentObject(UserListCoreDataViewModel())
            .environmentObject(RoleModelStrengthListCoreDataViewModel())
    }
}
