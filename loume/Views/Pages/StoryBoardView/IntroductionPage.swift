//
//  IntroductionPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 03/07/23.
//

import SwiftUI

struct IntroductionPage: View {
    @ObservedObject var userData: User
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
                userData.objectWillChange.send()
            }, label: {
                Text("Swipe to save data")
            })
        }
        
    }
}

struct IntroductionPage_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionPage(userData: User(name: "", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]), name: "").environmentObject(User(name: "", goals: []))
    }
}
