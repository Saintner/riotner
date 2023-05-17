//
//  ChallengerTierListView.swift
//  riotner
//
//  Created by Eris Ramirez on 15/05/23.
//

import SwiftUI

struct ChallengerTierListView: View {
    var vm: ChallengerTierListViewModel
    var body: some View {
        VStack {
            ForEach(vm.challengers, id: \.self) { x in
                Text("Hello, Challenger N°\(x + 1)").padding()
            }
        }
    }
}

struct ChallengerTierListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengerTierListView(vm: ChallengerTierListViewModel())
    }
}
