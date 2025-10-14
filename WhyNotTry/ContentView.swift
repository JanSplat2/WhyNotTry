//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dittrich, Jan - Student on 10/14/25.
//

import SwiftUI

struct ContentView: View {
    
    var activities = ["Archery", "Baseball", "Basketball", "Bowling"]
    
    @State var selected = "Archery"
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint]
                           
    @State private var id = 1
    
    var body: some View {
        VStack{
            Text("Why not try...")
                .font(.largeTitle.bold())
            Circle()
                .fill(colors.randomElement() ?? .blue)
                .padding()
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 144))
                        .foregroundColor(.white)
                )
            Text("\(selected)!")
                .font(.title)
            Button("Try again") {
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .transition(.slide)
        .id(id)
    }
    
}

#Preview {
    ContentView()
}
