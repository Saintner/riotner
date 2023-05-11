//
//  ContentView.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView = 0
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Tab 2")
                .tabItem {
                    Label("Champions", systemImage: "person.2.crop.square.stack")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
