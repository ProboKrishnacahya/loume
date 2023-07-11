//
//  interestView.swift
//  loume
//
//  Created by Yohan Wijaya on 03/07/23.
//

import SwiftUI

struct InterestView: View {
    @State var visible: Double = 1
    @State var visibleText2: Double = 0
    @State var visibleText3: Double = 0
    @State var visibleText4: Double = 0
    @State var visibleText5: Double = 0
    
    
    @State var hideButton: Double = 1
    @State private var fadeText1 = false
    @State private var fadeText2 = false
    @State private var disable1 = false
    @State private var disable2 = false
    @State private var isView2Active = false
    private static let size: CGFloat = 120
    private static let spacingBetweenColumns: CGFloat = 18
    private static let spacingBetweenRows: CGFloat = 1
    private static let totalcolumns: Int = 10
    @State private var isVisible = false
    @State private var angle = 0.0
    @State private var scalefade = 1.0
    @State private var scale = 1.0
    @State var rotation = 0.0
    @State private var rotationIntro = false
    @State private var flip = false
    @State private var selectedCircles: Set<Int> = []
    @State private var rotate1: Set<Int> = []
    
//    @State var visible: Double
//    @State var visibleText2: Double
//    @State var visibleText3: Double
//    @State var visibleText4: Double
//    @State var visibleText5: Double
//    @State var hideButton: Double
//    @State var fadeText1: Bool
//    @State var disable1: Bool
//    @State var disable2: Bool
//    @State var isView2Active: Bool
//    private static let size: CGFloat = 120
//    private static let spacingBetweenColumns: CGFloat = 18
//    private static let spacingBetweenRows: CGFloat = 1
//    private static let totalcolumns: Int = 10
//    @State var isVisible: Bool
//    @State var angle: Double
//    @State var scalefade: Double
//    @State var scale: Double
//    @State var rotation: Double
//    @State var rotationIntro: Bool
//    @State var flip: Bool
//    @State var selectedCircles: Set<Int>
//    @State var rotate1: Set<Int>
    
    let interest: [String] = ["Animal", "Animation", "Art", "Acting", "Astronomy", "Automotive", "Business", "Beauty", "Baking", "Board Game", "Books", "Cooking", "Crafts", "Culture", "Cosplay", "Content Creating", "Design", "Dance", "Drawing", "Engineering", "Entrepreneurship", "Exercising", "Entertainment", "Education", "Fashion", "Fishing", "Film", "Gardening", "Game", "History", "Investing", "Outdoor Activities", "Sports", "Journaling", "Music", "Marketing", "Language", "Photography", "Videography", "Public Speaking", "Painting", "Reading", "Science", "Swimming", "Singing", "Technology", "Traveling", "Trading", "Writing", "Politics"]
    let grid =  Array(
        repeating: GridItem(
            .fixed(size), spacing: spacingBetweenColumns, alignment: .center
        ),
        count: totalcolumns
    )
    
    @ObservedObject var userListCoreDataViewModel: UserListCoreDataViewModel
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @ObservedObject var loveListCoreDataViewModel: LoveListCoreDataViewModel
    
    var body: some View {
        ZStack{
            NavigationView{
                ZStack{
                    VStack{
                        Text("Before going further, let’s help you pick **your top 3 interests** so that we know how to guide you better personally.")
                            .multilineTextAlignment(.center)
                            .frame(width: 250.0)
                            .opacity(fadeText1 ? 1 : 0)
                            .animation(.easeIn(duration: 1).delay(1))
                            .onAppear {
                                withAnimation {
                                    fadeText1 = true
                                }
                            }
                    }
                    .opacity(disable1 ? 0 : 1)
                    .animation(.easeIn(duration: 0.5).delay(9))
                    .onAppear {
                        withAnimation {
                            disable1 = true
                        }
                    }
                    .animation(nil)
                    ZStack{
                        ScrollView([.horizontal], showsIndicators: false) {
                            LazyVGrid(
                                columns: grid,
                                spacing: Self.spacingBetweenRows
                            ) {
                                ForEach(interest.indices, id: \.self) { index in
                                    let value = interest[index]
                                    Circle()
                                        .stroke(selectedCircles.contains(index) ? Color("Axolotl"): Color("Axolotl"), lineWidth: 2)
                                        .background(selectedCircles.contains(index) ? Color("Axolotl"): .white)
                                        .cornerRadius(100)
                                        .frame(width: Self.size, height: Self.size)
                                    
                                        .rotationEffect(.degrees(rotation))
                                        .offset(
                                            x: offsetX(value),
                                            y: 0
                                        )
                                    
                                        .overlay {
                                            Text(value)
                                                .font(.caption)
                                                .fontWeight(.bold)
                                                .foregroundColor(selectedCircles.contains(index) ? .white: Color("Axolotl"))
                                                .multilineTextAlignment(.center)
                                                .offset(
                                                    x: offsetX(value),
                                                    y: 0
                                                )
                                                .opacity(isVisible ? 1 : 0)
                                                .animation(.easeIn(duration: 0.5))
                                                .onAppear {
                                                    withAnimation {
                                                        isVisible = true
                                                    }
                                                }
                                        }
                                        .onTapGesture {
                                            choseColor(index)
                                            scalefade += 1
                                        }
                                        .animation(.easeIn, value: scalefade)
                                }
                                .opacity(isVisible ? 1 : 0)
                                .animation(.easeIn(duration: 0.5).delay(9))
                                .onAppear {
                                    withAnimation {
                                        isVisible = true
                                    }
                                    
                                }
                                
                            }.padding(.leading, 10)
                                .padding(.trailing, 96)
                                .padding(.bottom, 150)
                                .padding(.top, 55)
                        }
                        .animation(nil)
                        VStack {
                            Spacer()
                            HStack{
                                Text("Pick things that u love to do")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding([.top, .leading, .bottom])
                                    .opacity(isVisible ? 1 : 0)
                                    .animation(.easeIn(duration: 1.5))
                                    .onAppear {
                                        withAnimation {
                                            isVisible = true
                                            
                                        }
                                    }
                                    .rotation3DEffect(.degrees(45), axis: (x: 0, y: 0, z: 0))
                                Spacer()
                                Circle()
                                    .frame(width: 65.0)
                                    .padding(.trailing)
                                    .foregroundColor(Color("Axolotl"))
                                    .opacity(isVisible ? 1 : 0)
                                    .animation(.easeIn(duration: 0.5).delay(0))
                                    .onAppear {
                                        withAnimation {
                                            isVisible = true
                                        }
                                    }.overlay{
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(Color.white)
                                            .padding(.trailing)
                                            .font(.system(size: 25))
                                    }
                                    .onTapGesture {
                                        isView2Active = true
                                    }
                            }
                        }
                        .padding(.bottom, 30)
                        .opacity(0)
                    }
                    .opacity(fadeText1 ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(1))
                    .onAppear {
                        withAnimation {
                            fadeText1 = true
                        }
                    }
                    .animation(nil)
                    
                   
                    VStack{
                        
                        Spacer()
                        HStack{
                            
                            Circle()
                                .frame(width: 80.0)
                                .padding(.leading)
                                .foregroundColor(Color("Chinese Orange"))
                                .overlay{
                                    Image(systemName: "arrow.left")
                                        .padding(.leading)
                                        .foregroundColor(Color.white)
                                }
                                .onTapGesture {
                                    disable1 = false
                                    
                                }
                                .opacity(0)
                            
                            Spacer()
                            HStack{
                                Text("1")
                                    .font(.callout)
                                Text("of")
                                    .font(.callout)
                                Text("2")
                                    .font(.callout)
                            }
                            .opacity(0)
                            Spacer()
                            Circle()
                                .frame(width: 80.0)
                                .padding(.trailing)
                                .foregroundColor(Color("Chinese Orange"))
                                .overlay{
                                    Image(systemName: "arrow.right")
                                        .padding(.trailing)
                                        .foregroundColor(Color.white)
                                }
                                .onTapGesture {
                                   
                                    isView2Active = true
                                    loveListCoreDataViewModel.addLoveEntity(interests: interest, selectedCircles: selectedCircles)
                                    
                                }
                                .overlay(
                                    NavigationLink(destination: InterestSelectedView(userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel).navigationBarBackButtonHidden(true), isActive: $isView2Active) {
                                        EmptyView()
                                    }
                                )
                                .opacity(fadeText2 ? 1 : 0)
                                .animation(.easeIn(duration: 1).delay(10))
                                .onAppear {
                                    withAnimation {
                                        fadeText2 = true
                                    }
                                }
                                

                            
                            
                        }
                        .opacity(visible)
                    }.padding()
                    
                }
                
            }
            .animation(nil)
            
//            VStack{
//                Spacer()
//                ZStack{ // button untuk next
                    


//                }
//                .opacity(hideButton)
//            }
//            .opacity(isVisible ? 1 : 0)
//            .animation(.easeIn(duration: 0.5).delay(11))
//            .onAppear {
//                withAnimation {
//                    isVisible = true
//                }
//
//            }
           
            
            
        }
        
        // ketika setelah pilih 3 bola hijau, maka klik button oren untuk nyimpan 3 interest yang sudah dipilih
        
        
    }
    func offsetX(_ value: String) -> CGFloat {
        let index = interest.firstIndex(of: value) ?? 0
        let rowNumber = index / grid.count
        
        if rowNumber % 2 == 0 {
            return Self.size / 2 + 5
        }
        return 0
    }
    
    func choseColor(_ index: Int) {
        if selectedCircles.contains(index) {
            selectedCircles.remove(index)
        } else {
            selectedCircles.insert(index)
        }
    }
    
}

struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        InterestView(
                     userListCoreDataViewModel: UserListCoreDataViewModel(),
                     goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                     planListCoreDataViewModel: PlanListCoreDataViewModel(),
                     subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel(),
                     loveListCoreDataViewModel: LoveListCoreDataViewModel())
    }
}
