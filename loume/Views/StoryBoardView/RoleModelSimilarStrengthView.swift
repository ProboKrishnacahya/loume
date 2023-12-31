//
//  roleModelSimilarStrength.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//
import SwiftUI


struct RoleModelSimilarStrengthView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State var roleModel1: String = ""
    @State private var isView2Active = false
    @State private var isView3Active = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Do you have any similar")
                    HStack {
                        Text("strength with")
                        Text("\(userListCoreDataViewModel.userEntities[0].roleModel)?")
                            .bold()
                    }
                }
                
                Rectangle()
                    .frame(width: 270.0, height: 40.0)
                    .cornerRadius(6)
                    .foregroundColor(Color("Chinese Orange"))
                    .overlay{
                        Text("Yes, of course!!")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                    .onTapGesture {
                        isView2Active = true
                    }
                    .overlay (
                        NavigationLink(destination: SimilarStrengthYes().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                            EmptyView()
                        }
                    )
                
                Rectangle()
                    .frame(width: 270.0, height: 40.0)
                    .cornerRadius(6)
                    .foregroundColor(Color("Chinese Orange"))
                    .overlay{
                        Text("No, i’m not sure :(")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                    .onTapGesture {
                        isView3Active = true
                    }
                    .overlay (
                        NavigationLink(destination: SimilarStrengthNo().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
                            EmptyView()
                        }
                    )
                
                Spacer()
                
                Image("RoleModelSimilarStrengthView")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
            }
            .frame(maxHeight:. infinity)
        }
    }
}

struct RoleModelSimilarStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelSimilarStrengthView()
            .environmentObject(UserListCoreDataViewModel())
    }
}
