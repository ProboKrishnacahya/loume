//
//  SecondaryButton.swift
//  loume
//
//  Created by Probo Krishnacahya on 12/07/23.
//

import SwiftUI

struct SecondaryButton: View {
    var label: String
    
    var body: some View {
        Text(label)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.clear)
            .foregroundColor(Color("Chinese Orange"))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Chinese Orange"), lineWidth: 2)
            )
    }
}
