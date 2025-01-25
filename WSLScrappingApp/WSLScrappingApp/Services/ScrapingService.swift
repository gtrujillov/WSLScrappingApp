//
//  ScrapingService.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import Foundation
import SwiftSoup

class ScrapingService {
    func fetchHTML(from url: String) async throws -> Document {
        guard let url = URL(string: url) else {
            throw NSError(domain: "Invalid URL", code: 1001, userInfo: nil)
        }
        let data = try Data(contentsOf: url)
        return try SwiftSoup.parse(String(data: data, encoding: .utf8)!)
    }
    
    func parseAthletes(from document: Document) -> [AthleteModel] {
        var athletes: [AthleteModel] = []
        
        let ahtletesElements: Elements = try! document.select(".athletes-directory-module__body .tooltip-item")
        
        for athlete in ahtletesElements {
            let name = try! athlete.select(".athlete-name").text()
            let country = try! athlete.select(".athlete-country-name").text()
            let category = try! athlete.select(".avatar-text-tertiary").text()
            let imgURL = try! athlete.select("a").attr("data-img-src")
            let athlete = AthleteModel(id: UUID(), name: name, country: country, category: category, imageURL: imgURL)
            athletes.append(athlete)
        }
        
        return athletes
    }
}
