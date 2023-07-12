//
//  MyInterestView.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct MyInterestView: View {
    
    @EnvironmentObject private var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("My Interest")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
//                        UpdateButton()
                    }
                    
                    VStack {
                        Text("I'm interested in anything related to..")
                        
                        ForEach(Array(loveListCoreDataViewModel.loveEntities.enumerated()), id: \.0) { index, loveEntity in
                            
                            ZStack {
                                Circle()
                                    .inset(by: 8)
                                    .stroke(Color("Light Moss Green"), lineWidth: 3)
                                    .frame(width: 165, height: 165)
                                
                                Circle()
                                    .frame(width: 140)
                                    .foregroundColor(Color("Lotion"))
                                    .overlay{
                                        HStack {
                                            Text("\(loveEntity.rank)")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("Axolotl"))
                                            
                                            Text(loveEntity.name)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("Axolotl"))
                                        }
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
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

struct MyInterestView_Previews: PreviewProvider {
    static var previews: some View {
        MyInterestView()
    }
}
