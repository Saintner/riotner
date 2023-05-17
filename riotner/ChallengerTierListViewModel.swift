//
//  ChallengerTierListViewModel.swift
//  riotner
//
//  Created by Eris Ramirez on 16/05/23.
//

import Foundation

class ChallengerTierListViewModel: ObservableObject {
    @Published var challengers: [RNChallengerTier] = []
    
    private var challengerIndex = 1
    private var tier = ""
    
    func onAppear() async {
        guard let challengerTierLsit = await RNNetworking.shared.getChallengersTierList(for: "") else { return }
        DispatchQueue.main.async {
            self.tier = challengerTierLsit.tier
            self.challengers = challengerTierLsit.entries.sorted(by: {$0.leaguePoints > $1.leaguePoints})
        }
    }
    
    func position() -> Int {
        let position = challengerIndex
        challengerIndex = challengerIndex + 1
        return position - challengers.count
    }
    
    func getPoints(of challenger: RNChallengerTier) -> String {
        let points = challenger.leaguePoints
        return "\(points) pts"
    }
    
    func getWinRate(of challenger: RNChallengerTier) -> String {
        let wins = Double(challenger.wins)
        let losses = challenger.losses
        let total = Double(wins) + Double(losses)
        let percentage: Double = wins / total
        let percentageExpression = percentage * 100
        return "\(percentageExpression.rounded(.awayFromZero))%"
    }
}
