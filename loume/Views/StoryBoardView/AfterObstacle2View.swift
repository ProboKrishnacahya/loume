//
//  afterObstacle2View.swift
//  LocalLoumeStory
//
//  Created by Yohan Wijaya on 06/07/23.
//

import SwiftUI

struct AfterObstacle2View: View {
    var body: some View {
        VStack{
            Text("So, did you find what you wanted to find? Let’s get ready to write them down!")
                .font(.title2)
                .multilineTextAlignment(.center)
                .frame(width: 250)
        }
    }
}

struct AfterObstacle2View_Previews: PreviewProvider {
    static var previews: some View {
        AfterObstacle2View()
    }
}
