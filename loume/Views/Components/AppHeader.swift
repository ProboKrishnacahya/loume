//
//  AppHeader.swift
//  loume
//
//  Created by Nur Azizah on 27/06/23.
//

import SwiftUI

struct AppHeader: View {
    @State var isClicked = false
    @Binding var instanceSoundManager: SoundManager
    @Binding var instanceAppHeaderViewModel: AppHeaderViewModel
    
    var body: some View {
        Button(action: {
            instanceAppHeaderViewModel.toggleBackgroundSound(instanceSoundManager: instanceSoundManager,
                                                             isClicked: &isClicked)
        }) {
            Image(systemName: instanceAppHeaderViewModel.getBackgroundSoundIcon(isClicked: isClicked))
                .font(.system(size: 48))
                .foregroundColor(Color("Axolotl"))
        }
    }
}

struct AppHeader_Previews: PreviewProvider {
    static var previews: some View {
        AppHeader(instanceSoundManager: .constant(SoundManager()),
                  instanceAppHeaderViewModel: .constant(AppHeaderViewModel()))
    }
}
