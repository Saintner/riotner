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
  
    func getChampions() async -> (RNChampionList?, Error?) {
        let (champs, error) = await makeDDragonRequest(with: "cdn/13.9.1/data/\(localeLanguage?.serverLanguageIdentifier ?? "")/champion.json", and: RNChampionList.self)
        if (error != nil) {
            return (nil, error)
        } else {
           return (champs, nil)
        }
    }
    
    func getChallengersTierList(for server: String) async -> RNChallengersTierList? {
        print("aqca")
        let (challengers, error) = await makeLOLAPIRequest(with: "lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5", and: RNChallengersTierList.self)
        if error != nil {
            
            return nil
        } else {
            return challengers
        }
    }
    
    private func makeLOLAPIRequest<T: Codable>(with url: String, and type: T.Type) async -> (T?, Error?) {
        let headers = HTTPHeaders(["X-Riot-Token": "RGAPI-93ea4b56-e9c7-475c-89bc-ed8debb0fdae"])
        return await makeRequest(with: RNBaseURL.shared.getLolBaseUrl(with: url), headers: headers, and: type)
    }
    
    private func makeDDragonRequest<T: Codable>(with url: String, and type: T.Type) async -> (T?, Error?) {
        await makeRequest(with: RNBaseURL.shared.getdDragonURL(with: url), and: type)
    }
    
//    private func makeRequest<T: Codable>(with url: String, and codableType: T.Type) async -> (T?, Error?) {
//        do {
//            let rq = try await AF.request(url).serializingDecodable(T.self).value
//            return (rq, nil)
//        } catch (let err) {
//            return (nil, err)
//        }
//    }
    
    private func makeRequest<T: Codable>(with url: String, headers: HTTPHeaders? = nil, and type: T.Type) async -> (T?, Error?) {
        do {
            let rq = try await AF.request(url, headers: headers).serializingDecodable(T.self).value
            return (rq, nil)
        } catch (let error) {
            return (nil, error)
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
