//
//  IntroductionView.swift
//  comee
//
//  Created by Nur Azizah on 27/06/23.
//

import SwiftUI

struct IntroductionView: View {
    @EnvironmentObject var userData: User
    @State var name:String
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Text("Let's get o know you better..")
            TextField("What's your name?", text: self.$name)
                .padding()
                .fontWeight(.medium)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //munculkan animasi swipeup jika field nama telah diisi
            //code here...
            
            //simpan data nama jika button di klik
            Button(action: {
                userData.setName(name: self.name)
            }, label: {
                Text("Swipe to save data")
            })
        }
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(name: "").environmentObject(User(name: "", goals: []))
    }
}
