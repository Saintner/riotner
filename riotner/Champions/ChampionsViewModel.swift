//
//  ChampionsViewModel.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import Foundation

class ChampionsViewModel: ObservableObject {
    @Published var champions = [RNChampionId]()
    
    private var championsList:  [RNChampionId.RawValue: RNChampion] = [:]
    
    func loadChampions() async {
        let (champList, _) = await RNNetworking.shared.getChampions()
        guard let champs = champList else { return }
        for champ in RNChampionId.allCases {
            DispatchQueue.main.async {
                self.champions.append(champ)
            }
            championsList = champs.data
        }
    }
    
    func champName(for champ: RNChampionId) -> String {
        guard let actChampion = championsList[champ.rawValue] else { return "" }
        return actChampion.name
    }
}
