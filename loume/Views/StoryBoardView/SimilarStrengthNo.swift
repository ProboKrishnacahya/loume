//
//  similarStrenghtNo.swift
//  loume
//
//  Created by Yohan Wijaya on 04/07/23.
//

import SwiftUI

struct SimilarStrengthNo: View {
    var body: some View {
        VStack {
            Text("It’s okay! I’m sure you can")
            HStack {
                Text("attain some of")
                Text("Mark Lee")
                    .fontWeight(.bold)
            }
            Text("positive traits one day soon!")
            Text("For now, let’s try discovering")
            Text("your strengths.")
        }
        
    }
}

struct SimilarStrengthNo_Previews: PreviewProvider {
    static var previews: some View {
        SimilarStrengthNo()
    }
}
