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
    
    init() {
        let language = Locale.current.language
        localeLanguage = language.region?.identifier
    }
    func getChampions() async {
        do {
            var championsData = try await AF.request("http://ddragon.leagueoflegends.com/cdn/13.9.1/data/\(localeLanguage?.serverLanguageIdentifier ?? "")/champion.json").serializingData().value
            var champions = try JSONSerialization.jsonObject(with: championsData)
            print(champions)
        } catch(let err) {
            print(err.localizedDescription)
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
