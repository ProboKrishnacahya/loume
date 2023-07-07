//
//  EmptyView.swift
//  loume
//
//  Created by Nur Azizah on 06/07/23.
//

import SwiftUI

struct EmptyStateView: View {
    let type: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "folder.badge.questionmark")
                .font(.system(size: 64))
            
            Text("Your \(type)s are still empty.\n**Let's make your \(type)s**")
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.secondary)
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(type: "goal")
    }
}
