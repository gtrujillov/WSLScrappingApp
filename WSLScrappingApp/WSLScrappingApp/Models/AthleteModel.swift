//
//  AthleteModel.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import Foundation

import Foundation

struct AthleteModel: Identifiable {
    var id: UUID
    var name: String
    var country: String
    var category: String
    var imageURL: String
    var detailUrl: String?
    
    init(
        id: UUID,
        name: String,
        country: String,
        category: String,
        imageURL: String,
        detailUrl: String? = nil
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.category = category
        self.imageURL = imageURL
        self.detailUrl = detailUrl
    }
}
