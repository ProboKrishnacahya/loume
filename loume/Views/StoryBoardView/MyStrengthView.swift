//
//  myStrengthView.swift
//  loume
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct MyStrengthView: View {
    @State var roleModel1: String = ""
    @State var roleModel2: String = ""
    @State var roleModel3: String = ""
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Steps I need to take to")
                .font(.title3)
                .multilineTextAlignment(.center)
            Text("be a choreograper")
                .font(.title3)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            HStack{
                Circle()
                    .frame(width: 30.0)
                    .foregroundColor(Color("Axolotl"))
                    .overlay{
                        Text("1")
                            .foregroundColor(Color.white)
                    }
                TextField("Enter username...", text: $roleModel1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .frame(width:  250)
                    .animation(Animation.easeInOut(duration: 1.5))
            }.padding(.top)
            HStack{
                Circle()
                    .frame(width: 30.0)
                    .foregroundColor(Color("Axolotl"))
                    .overlay{
                        Text("2")
                            .foregroundColor(Color.white)
                    }
                TextField("Enter username...", text: $roleModel2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .frame(width:  250)
                    .animation(Animation.easeInOut(duration: 1.5))
            }
            .padding(.top, 5)
            HStack{
                Circle()
                    .frame(width: 30.0)
                    .foregroundColor(Color("Axolotl"))
                    .overlay{
                        Text("3")
                            .foregroundColor(Color.white)
                    }
                TextField("Enter username...", text: $roleModel2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .frame(width:  250)
                    .animation(Animation.easeInOut(duration: 1.5))
            }
            .padding(.top, 5)
            
            Spacer()
        }
       
    }
}

struct MyStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        MyStrengthView()
    }
}
