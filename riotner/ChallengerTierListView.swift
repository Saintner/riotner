//
//  ChallengerTierListView.swift
//  riotner
//
//  Created by Eris Ramirez on 15/05/23.
//

import SwiftUI

struct ChallengerTierListView: View {
    @StateObject var vm: ChallengerTierListViewModel
    var body: some View {
        VStack {
            HStack {
                Text("#")
                Spacer()
                Text("Summoners")
                Spacer()
                Text("Tier")
                Spacer()
                Text("Win Rate")
                Spacer()
            }
            .font(.headline)
                ForEach(vm.challengers, id: \.self) { challenger in
                    HStack {
                        Text("\(vm.position())").font(.system(size: 10))
                        Spacer()
                        Text(challenger.summonerName).font(.system(size: 8))
                        Spacer()
                        Text(vm.getPoints(of: challenger)).font(.system(size: 8))
                        Spacer()
                        Text(vm.getWinRate(of: challenger)).font(.system(size: 8))
                        Spacer()
                    }.padding(.vertical, 50)
                }
        }.onAppear {
            Task {
                await vm.onAppear()
            }
        }
    }
}

struct ChallengerTierListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengerTierListView(vm: ChallengerTierListViewModel())
    }
}
