//
//  PrimaryButton.swift
//  comee
//
//  Created by Probo Krishnacahya on 05/05/23.
//

import SwiftUI

struct PrimaryButton: View {
    var label: String
    
    var body: some View {
        Text(label)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("Axolotl"))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
