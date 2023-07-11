//
//  roleModelSimilarStrength.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct RoleModelSimilarStrengthView: View {
    @State var roleModel1: String = ""
    var body: some View {
        VStack{
            VStack{
                Text("Do you have any similar")
                HStack{
                    Text("strength with")
                    Text("Mark Lee?")
                        .fontWeight(.bold)
                    //ganti "Mark Lee" pada Text baris di atas dengan
                    //userListCoreDataViewModel.userEntities[0].roleModel
                    
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
                Rectangle()
                    .frame(width: 270.0, height: 40.0)
                    .cornerRadius(6)
                    .foregroundColor(Color("Axolotl"))
                    .overlay{
                        Text("No, i’m not sure :(")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
            }
            
        }
        
    }
}

struct RoleModelSimilarStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelSimilarStrengthView()
    }
}
