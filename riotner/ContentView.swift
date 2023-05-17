//
//  ContentView.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var champions = ChampionsViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            NavigationStack {
                ChampionsListView()
                    .environmentObject(champions)
            }
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
