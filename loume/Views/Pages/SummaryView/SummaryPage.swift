//
//  SummaryPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 03/07/23.
//

import SwiftUI

struct SummaryPage: View {
    let backgroundColor: Color
    let summariesData = [
        SummaryData(title: "My Interest", backgroundColor: Color("Artichoke"), foregroundColor: .white),
        SummaryData(title: "My Role Model", backgroundColor: Color("Axolotl"), foregroundColor: .white),
        SummaryData(title: "My Strengths", backgroundColor: Color("Light Moss Green"), foregroundColor: Color("Axolotl")),
        SummaryData(title: "My Weakness", backgroundColor: Color("Axolotl"), foregroundColor: .white),
        SummaryData(title: "My Goal", backgroundColor: Color("Light Moss Green"), foregroundColor: Color("Axolotl")),
        SummaryData(title: "Obstacles to My Goal", backgroundColor: Color("Artichoke"), foregroundColor: Color.white)
        ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 24) {
                        HStack {
                            Text("About Me")
                                .font(.largeTitle.bold())
                            
                            Spacer()
                            
                            Image(systemName: "gear.circle.fill")
                                .font(.system(size: 48))
                                .foregroundColor(Color("Axolotl"))
                        }
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                            ForEach(summariesData, id: \.title) { summaryData in
                                NavigationLink(destination: DetailView(title: summaryData.title)) {
                                    SummaryContent(summaryData: summaryData)
                                }
                            }
                        }
                        
                        PrimaryButton(label: "Reflect Again")
                    }
                    .padding()
                }
                .navigationBarTitle("About Me")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .tint(Color("Axolotl"))
        }
    }
}

struct SummaryData: Identifiable {
    let id = UUID()
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
}

struct SummaryContent: View {
    let summaryData: SummaryData
    
    var body: some View {
        VStack {
            Text(summaryData.title)
                .font(.title3.bold())
                .foregroundColor(summaryData.foregroundColor)
                .padding()
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, minHeight: 144, alignment: .bottomLeading)
        .background(summaryData.backgroundColor)
        .cornerRadius(16)
    }
}

struct DetailView: View {
    var title: String
    
    var body: some View {
        Text("Detail for \(title)")
            .font(.title)
            .padding()
    }
}


struct SummaryPage_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPage(backgroundColor: Color("Lotion"))
    }
}

