//
//  Networking.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import Foundation
import Alamofire

class RNNetworking {
    static let shared = RNNetworking()
    var localeLanguage: String?
    private let developmentKey = "RGAPI-7234e4cb-6f7f-4bcf-bcf6-750528dbb024"
    private let dDragonBaseURL = "http://ddragon.leagueoflegends.com/cdn/"
    private let riotBaseURL = "https://la2.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5"
    
    init() {
        let language = Locale.current.language
        localeLanguage = language.region?.identifier
    }
    func getChampions() async {
        let (champs, error) = await makeDDragonRequest(with: "cdn/13.9.1/data/\(localeLanguage?.serverLanguageIdentifier ?? "")/champion.json", and: RNChampionList.self)
        if (error != nil) {
            print("error")
        } else {
            print(champs!)
        }
    }
    
    private func makeDDragonRequest<T: Codable>(with url: String, and type: T.Type) async -> (T?, Error?) {
        await makeRequest(with: RNBaseURL.shared.getdDragonURL(with: url), and: type)
    }
    
    private func makeRequest<T: Codable>(with url: String, and codableType: T.Type) async -> (T?, Error?) {
        do {
            let rq = try await AF.request(url).serializingDecodable(T.self).value
            return (rq, nil)
        } catch (let err) {
            return (nil, err)
        }
    }
}

extension String {
    var serverLanguageIdentifier: Self {
        switch self {
        case "US": return "en_US"
        default:
            return "zh_TW"
        }
    }
}
