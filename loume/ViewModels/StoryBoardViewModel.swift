//
//  StoryBoardViewModel.swift
//  loume
//
//  Created by Nur Azizah on 30/06/23.
//

import Foundation
import SafariServices

class StoryBoardViewModel {
    
    func openSafari(goal: String) {
        let urlString = "https://www.google.com/search?q="
        let query = "How to " + goal
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let fullURLString = urlString + encodedQuery + "&btnI"
        
        if let url = URL(string: fullURLString) {
            if let windowScene = UIApplication.shared.windows.first?.windowScene {
                let safariViewController = SFSafariViewController(url: url)
                windowScene.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
            }
            //self.present(safariViewController, animated: true, completion: nil)
        }
    }
}
