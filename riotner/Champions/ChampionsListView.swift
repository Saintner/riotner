//
//  ChampionsListView.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import SwiftUI

struct ChampionsListView: View {
    @EnvironmentObject var vm: ChampionsViewModel
    @State private var searchText = ""
    var body: some View {
            List(vm.champions, id: \.self) { champion in
                NavigationLink {
                    Text(vm.champName(for: champion))
                } label: {
                    Text(vm.champName(for: champion))
                }
            }
            .searchable(text: $searchText,
                        prompt: "Search for champion")
            .navigationTitle("Champions")
            .onAppear {
                Task {
                    await vm.loadChampions()
                }
            }
        }
}

struct ChampionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionsListView().environmentObject(ChampionsViewModel())
    }
}
