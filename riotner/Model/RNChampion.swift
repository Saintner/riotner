//
//  RNChampion.swift
//  riotner
//
//  Created by Eris Ramirez on 11/05/23.
//

import Foundation

struct  RNChampionList: Codable {
    var data: [RNChampionId.RawValue: RNChampion]
    var format: String
    var type: String
    var version: String
}

struct RNChampion: Codable {
    var blurb: String
    var id: RNChampionId
    var image: RNChampionImage
    var info: RNChampionInfo
    var key: String
    var name: String
    var partype: String
    var stats: RNChampionStats
    var tags: [RNChampionTags]
    var title: String
    var version: String
}


enum RNChampionId: String, Codable {
    case Aatrox
    case Ahri
    case Akali
    case Akshan
    case Alistar
    case Amumu
    case Anivia
    case Annie
    case Aphelios
    case Ashe
    case AurelionSol
    case Azir
    case Bard
    case Belveth
    case Blitzcrank
    case Brand
    case Braum
    case Caitlyn
    case Camille
    case Cassiopeia
    case Chogath
    case Corki
    case Darius
    case Diana
    case DrMundo
    case Draven
    case Ekko
    case Elise
    case Evelynn
    case Ezreal
    case Fiddlesticks
    case Fiora
    case Fizz
    case Galio
    case Gangplank
    case Garen
    case Gnar
    case Gragas
    case Graves
    case Gwen
    case Hecarim
    case Heimerdinger
    case Illaoi
    case Irelia
    case Ivern
    case Janna
    case JarvanIV
    case Jax
    case Jayce
    case Jhin
    case Jinx
    case KSante
    case Kaisa
    case Kalista
    case Karma
    case Karthus
    case Kassadin
    case Katarina
    case Kayle
    case Kayn
    case Kennen
    case Khazix
    case Kindred
    case Kled
    case KogMaw
    case Leblanc
    case LeeSin
    case Leona
    case Lillia
    case Lissandra
    case Lucian
    case Lulu
    case Lux
    case Malphite
    case Malzahar
    case Maokai
    case MasterYi
    case Milio
    case MissFortune
    case MonkeyKing
    case Mordekaiser
    case Morgana
    case Nami
    case Nasus
    case Nautilus
    case Neeko
    case Nidalee
    case Nilah
    case Nocturne
    case Nunu
    case Olaf
    case Orianna
    case Ornn
    case Pantheon
    case Poppy
    case Pyke
    case Qiyana
    case Quinn
    case Rakan
    case Rammus
    case RekSai
    case Rell
    case Renata
    case Renekton
    case Rengar
    case Riven
    case Rumble
    case Ryze
    case Samira
    case Sejuani
    case Senna
    case Seraphine
    case Sett
    case Shaco
    case Shen
    case Shyvana
    case Singed
    case Sion
    case Sivir
    case Skarner
    case Sona
    case Soraka
    case Swain
    case Sylas
    case Syndra
    case TahmKench
    case Taliyah
    case Talon
    case Taric
    case Teemo
    case Thresh
    case Tristana
    case Trundle
    case Tryndamere
    case TwistedFate
    case Twitch
    case Udyr
    case Urgot
    case Varus
    case Vayne
    case Veigar
    case Velkoz
    case Vex
    case Vi
    case Viego
    case Viktor
    case Vladimir
    case Volibear
    case Warwick
    case Xayah
    case Xerath
    case XinZhao
    case Yasuo
    case Yone
    case Yorick
    case Yuumi
    case Zac
    case Zed
    case Zeri
    case Ziggs
    case Zilean
    case Zoe
    case Zyra
}

enum RNChampionTags: String, Codable {
    case Fighter
    case Tank
    case Mage
    case Assassin
    case Marksman
    case Support
}


struct RNChampionImage: Codable {
    var full: String
    var group: String
    var h: Int
    var sprite: String
    var w: Int
    var x: Int
    var y: Int
}

struct RNChampionInfo: Codable {
    var attack: Int
    var defense: Int
    var difficulty: Int
    var magic: Int
}

struct RNChampionStats: Codable {
    var armor: Int
    var armorperlevel: Double
    var attackdamage: Int
    var attackdamageperlevel: Double
    var attackrange: Int
    var attackspeed: Double
    var attackspeedperlevel: Double
    var crit: Int
    var critperlevel: Double
    var hp: Int
    var hpperlevel: Double
    var hpregen: Double
    var hpregenperlevel: Double
    var movespeed: Int
    var mp: Int
    var mpperlevel: Double
    var mpregen: Double
    var mpregenperlevel: Double
    var spellblock: Int
    var spellblockperlevel: Double
}
