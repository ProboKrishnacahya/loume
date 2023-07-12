//
//  SummaryResult.swift
//  loume
//
//  Created by Probo Krishnacahya on 10/07/23.
//

import SwiftUI

struct SummaryResultCard: View {
    var label: String
    
    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color("Lotion"))
            .foregroundColor(.black)
            .cornerRadius(8)
    }
}
