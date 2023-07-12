//
//  UpdateButton.swift
//  loume
//
//  Created by Probo Krishnacahya on 11/07/23.
//

import SwiftUI

struct UpdateButton: View {
    @State private var isShowingUpdateView = false
    
    var body: some View {
        Button(action: {
            isShowingUpdateView = true
        }) {
            Image(systemName: "pencil")
                .padding()
                .foregroundColor(.white)
                .background(Color("Chinese Orange"))
                .clipShape(Circle())
        }
        .fullScreenCover(isPresented: $isShowingUpdateView) {
            UpdateView(isPresented: $isShowingUpdateView)
        }
    }
}

struct UpdateView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("You've input the new role model.\nDo you want to update?")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Button(action: {
                // Perform data update logic
                
                // Dismiss the UpdateView
                isPresented = false
            }) {
                PrimaryButton(label: "Update")
            }
            Button(action: {
                isPresented = false
            }) {
                SecondaryButton(label: "Dismiss")
            }
        }
        .padding()
    }
}
