//
//  HomeView.swift
//  riotner
//
//  Created by Eris Ramirez on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    private var sections = [1,2,3,4]
    var body: some View {
        VStack {
            List {
                ForEach(sections, id: \.self) { section in
                    Section {
                        switch section {
                        case 4: ChallengerTierListView(vm: ChallengerTierListViewModel())
                        default: Text("Section \(section)")
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
