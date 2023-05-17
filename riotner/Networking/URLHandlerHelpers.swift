//
//  URLHandlerHelpers.swift
//  riotner
//
//  Created by Eris Ramirez on 17/05/23.
//

import Foundation

enum RNSubDomainType {
    case dDragon
    case riot
    case other
}

protocol RNProtocol {
    var unsafeProtocol: String { get }
    var safeProtocol: String { get }
}

extension RNProtocol {
    var unsafeProtocol: String {
        return "http"
    }
    var safeProtocol: String {
        return "https"
    }
}

protocol RNSubDomain: RNProtocol {
    var subdomain: (RNSubDomainType, Locale) -> String { get }
    var riotServer: (Locale) -> String { get }
}

extension RNSubDomain {
    var subdomain: (RNSubDomainType, Locale) -> String {
        func decideDomain(domain: RNSubDomainType, locale: Locale) -> String {
            var result = ""
            switch domain {
            case .dDragon: result = unsafeProtocol + "://" + "ddragon" + "."
            case .riot: result =  safeProtocol + "://" + riotServer(locale) + "."
            case .other: result = "www"
            }
            return result
        }
        return decideDomain(domain:locale:)
    }
    
    var riotServer: (Locale) -> String {
        return getLocale(locale:)
    }
    
    private func getLocale(locale: Locale) -> String {
        var language = locale.language
        guard let region = language.region else { return "en_US"}
        let identifier = region.identifier
        var server = ""
        switch identifier {
        case "US": server = "NA1"
        default:
            server = "LA2"
        }
        return server.lowercased() + "." + "api"
    }
}

protocol RNDomain: RNSubDomain {
    var domain: (RNSubDomainType, Locale) -> String { get }
}

extension RNDomain {
    var domain: (RNSubDomainType, Locale) -> String {
        func result( subDomainType: RNSubDomainType, locale: Locale ) -> String {
            var dom = ""
            switch subDomainType {
            case .riot, .other: dom = "riotgames.com"
            case .dDragon: dom = "leagueoflegends.com"
            }
            return subdomain(subDomainType, locale) + dom
        }
        return result(subDomainType:locale:)
    }
}

class RNBaseURL: RNDomain {
    static let shared = RNBaseURL()
    
    func getdDragonURL(with path: String) -> String {
        let domain =  domain(.dDragon,.current)
        return domain + "/" + path
    }
    
    func getLolBaseUrl(with path: String) -> String {
        let domain = domain(.riot, .current)
        return domain + "/" + path
    }
}
