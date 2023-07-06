//
//  EmptyView.swift
//  loume
//
//  Created by Nur Azizah on 06/07/23.
//

import SwiftUI

struct EmptyState: View {
    let systemNameImage: String
    let type: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: systemNameImage)
                .font(.system(size: 64))
            
            Text("Your \(type)s are still empty.\n**Let's make your \(type)s**")
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.gray)
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(systemNameImage: "folder.badge.questionmark", type: "goal")
    }
}
