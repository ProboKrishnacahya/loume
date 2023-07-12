//
//  IntroductionPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 03/07/23.
//

import SwiftUI

struct IntroductionView: View {
//    @ObservedObject var userData: User
    @State var name:String
    @State private var offset = CGSize.zero
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    
    var body: some View {
        VStack {
//            Text("Let's get o know you better..")
//            TextField("What's your name?", text: self.$name)
//                .padding()
//                .fontWeight(.medium)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            //munculkan animasi swipeup jika field nama telah diisi
//            //code here...
//
//            //simpan data nama jika button di klik
//            Button(action: {
//                userData.setName(name: self.name)
//                userData.objectWillChange.send()
//            }, label: {
//                Text("Swipe to save data")
//            })
            Text(String(userListCoreDataViewModel.userEntities.count))
            List {
                ForEach(userListCoreDataViewModel.userEntities, id: \.id) { user in
                    VStack {
                        Text(user.name)
                        
                        Button(action: {
                            userListCoreDataViewModel.deleteUser(userCoreDataModel: user)
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("Axolotl"))
                                .clipShape(Circle())
                        }
                        Button(action: {
                            userListCoreDataViewModel.saveUserEntity(name: "zzh")
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.red)
                                .background(Color("Axolotl"))
                                .clipShape(Circle())
                        }
                    }
                }
            }        }
        .onAppear(perform: {
            userListCoreDataViewModel.getUserEntities()
            userListCoreDataViewModel.deleteUserEntityAll()
        })
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(name: "", userListCoreDataViewModel: UserListCoreDataViewModel())
    }
}
