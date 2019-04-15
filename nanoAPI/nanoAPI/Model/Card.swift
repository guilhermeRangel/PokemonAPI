//
//  Card.swift
//  nanoAPI
//
//  Created by Vitor Demenighi on 15/04/19.
//  Copyright © 2019 Vitor Demenighi. All rights reserved.
//

import Foundation


struct TopLevel: Codable {
    var cards: [Card]
}



struct Card: Codable {
    var id:String? //
    var name:String? //
    var nationalPokedexNumber:Int? //
    var imageUrl:String? //
    var imageUrlHiRes:String? //
    var types:[String]? //
    
    var supertype:String? //
    var subtype:String? //
    
    var evolvesFrom:String?
    var hp:String? //
    var retreatCost:[String]? //
    var number:String? //
    var artist:String? //
    var rarity:String? //
    var series:String? //
    var set:String? //
    var setCode:String? //
    var attacks:[attacks]?
    var resistances:[resistances]?
    var weaknesses:[weaknesses]?
    
}

struct attacks: Codable {
    var cost:[String]?
    var name:String?
    var text:String?
    var damage:String?
    var convertedEnergyCost:Int?
}

struct resistances : Codable {
    var type:String?
    var value:String?
}

struct weaknesses : Codable {
    var type:String?
    var value:String?
}
