//
//  ModalViewModal.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import Foundation
import SwiftUI

struct ModalViewModel {
    
    func getNavigationBarTitle(type: String) -> String {
        if type == "goal" {
            return "Add Goal"
        } else {
            return "Add Plan"
        }
    }
    
    func getNameFormDescription(type: String) -> String {
        if type == "goal" {
            return "Goal Name"
        } else {
            return "Plan Name"
        }
    }
}
