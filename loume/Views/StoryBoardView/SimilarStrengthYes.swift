//
//  similarStrengthYes.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthYes: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    
    @State var roleModelStrengthSimilar: String = ""
    @State var prev: Double = 1
    @State var next: Double = 1
    @State private var isView2Active = false
    @State private var isView3Active = false
    
    var body: some View {
        NavigationView {
            ZStack{
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
                    
                    TextField("Strength or speciality...", text: $roleModelStrengthSimilar)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:  290)
                        .animation(Animation.easeInOut(duration: 1.5))
                        .padding(.top, 20)
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
                                isView3Active = true
                            }
                            .overlay{
                                NavigationLink(destination: RoleModelSimilarStrengthView().navigationBarBackButtonHidden(true), isActive: $isView3Active) {
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
                                
                                userListCoreDataViewModel.setStrengthSimilar(strengthSimilar: roleModelStrengthSimilar)
                            }
                            .overlay{
                                NavigationLink(destination: StrengthOut().navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                }
                            }
                    }
                }
            }
        }
        .animation(nil)
    }
}

struct SimilarStrengthYes_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthYes()
            .environmentObject(UserListCoreDataViewModel())
    }
}
