//
//  ContentViewModel.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import Foundation

struct ContentViewModel {
    
    func getImage(selectedTab:Int, tag: Int, type: String) -> String {
        if type == "Goals" {
            if selectedTab == tag {
                return "chart.bar.doc.horizontal.fill"
            } else {
                return "chart.bar.doc.horizontal"
            }
        } else {
            if selectedTab == tag {
                return "heart.circle.fill"
            } else {
                return "heart.circle"
            }
        }
    }
}
