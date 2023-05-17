//
//  RNChallengersTierList.swift
//  riotner
//
//  Created by Eris Ramirez on 17/05/23.
//

import Foundation

struct RNChallengersTierList: Codable {
    var leagueId: String
    var entries: [RNChallengerTier]
    var tier: String
    var name: String
    var queue: String
}

struct RNChallengerTier: Codable {
    var freshBlood: Bool
    var wins: Int    //Winning team on Summoners Rift.
    var summonerName: String
    var miniSeries: RNChallengerMiniSeries?
    var inactive: Bool
    var veteran: Bool
    var hotStreak: Bool
    var rank: String
    var leaguePoints: Int
    var losses: Int   // Losing team on Summoners Rift.
    var summonerId: String
}

extension RNChallengerTier: Hashable {
    func hash(into hasher: inout Hasher) {
        return hasher.combine(summonerId)
    }
    static func == (lhs: RNChallengerTier, rhs: RNChallengerTier) -> Bool {
        return lhs.summonerId == rhs.summonerId
    }
}

struct RNChallengerMiniSeries: Codable {
    var losses: Int
    var progress: String
    var target: Int
    var wins: Int
}
