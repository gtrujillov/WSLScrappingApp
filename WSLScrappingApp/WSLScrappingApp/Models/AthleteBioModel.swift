//
//  AthleteBioModel.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 26/1/25.
//

import Foundation

struct AthleteBioModel {
    var stance: String?
    var firstSeason: String?
    var age: String?
    var height: String?
    var weight: String?
    var hometown: String?
    
    init(
        stance: String? = nil,
        firstSeason: String? = nil,
        age: String? = nil,
        height: String? = nil,
        weight: String? = nil,
        hometown: String? = nil
    ) {
        self.stance = stance
        self.firstSeason = firstSeason
        self.age = age
        self.height = height
        self.weight = weight
        self.hometown = hometown
    }
}
