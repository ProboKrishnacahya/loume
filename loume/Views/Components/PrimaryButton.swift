//
//  PrimaryButton.swift
//  loume
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
            .background(Color("Chinese Orange"))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
