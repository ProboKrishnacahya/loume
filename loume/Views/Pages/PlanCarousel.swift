//
//  Carousel.swift
//  loume
//
//  Created by Probo Krishnacahya on 06/07/23.
//

import SwiftUI

struct PlanCarousel: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    private let data: [String] = ["1", "2", "3"]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<data.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 16)
                        .fill(Color("Light Moss Green"))
                        .padding()
                        .frame(width: 310, height: 500)
                        .overlay(
                            //inside box
                            Text("list")
                        )
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) * 310 + dragOffset, y: 0)
                }
            }
            .gesture(DragGesture()
                .onEnded({ value in
                    let threshold: CGFloat = 0
                    if value.translation.width > threshold {
                        withAnimation {
                            currentIndex = max(0, currentIndex - 1)
                        }
                    } else if value.translation.width < -threshold {
                        withAnimation {
                            currentIndex = min(data.count - 1, currentIndex + 1)
                        }
                    }
                })
            )
        }
    }
}

struct PlanCarousel_Previews: PreviewProvider {
    static var previews: some View {
        PlanCarousel()
    }
}
