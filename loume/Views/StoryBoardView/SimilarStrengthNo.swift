//
//  similarStrenghtNo.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthNo: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State var prev: Double = 1
    @State var next: Double = 1
    @State private var isView2Active = false
    @State private var isView3Active = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Text("It’s okay! I’m sure you can")
                    
                    HStack {
                        Text("attain some of")
                        
                        Text(userListCoreDataViewModel.userEntities[0].roleModel)
                            .bold()
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
                                NavigationLink(destination: RoleModelSimilarStrengthView().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
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
                                isView3Active = true
                            }
                            .overlay{
                                NavigationLink(destination: StrengthOut().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
                                }
                            }
                    }
                }
            }
        }.animation(nil)
    }
}

struct SimilarStrengthNo_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthNo()
            .environmentObject(UserListCoreDataViewModel())
    }
}
