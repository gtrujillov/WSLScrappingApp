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
        
        do {
            let ahtletesElements: Elements = try document.select(".athletes-directory-module__body .tooltip-item")
            for athlete in ahtletesElements {
                let name = try athlete.select(".athlete-name").text()
                let country = try athlete.select(".athlete-country-name").text()
                let category = try athlete.select(".avatar-text-tertiary").text()
                let imgURL = try athlete.select("a").attr("data-img-src")
                let detailUrl = try athlete.select("a").attr("href")
                let athlete = AthleteModel(
                    id: UUID(),
                    name: name,
                    country: country,
                    category: category,
                    imageURL: imgURL,
                    detailUrl: detailUrl
                )
                athletes.append(athlete)
            }
        } catch {
            print("Error parsing HTML: \(error)")
        }
        return athletes
    }
    
    func parseAthletesBioInfo(from document: Document) -> AthleteBioModel? {
        do {
            let stance = try document.select(".new-athlete-bio-stats .label:contains(Stance) + .value").text()
            let firstSeason = try document.select(".new-athlete-bio-stats .label:contains(First season) + .value").text()
            let ageImperial = try document.select(".new-athlete-bio-stats .label:contains(Age) + .value .imperial").text()
            let ageMetric = try document.select(".new-athlete-bio-stats .label:contains(Age) + .value .metric").text()
            let heightImperial = try document.select(".new-athlete-bio-stats .label:contains(Height) + .value .imperial").text()
            let heightMetric = try document.select(".new-athlete-bio-stats .label:contains(Height) + .value .metric").text()
            let weightImperial = try document.select(".new-athlete-bio-stats .label:contains(Weight) + .value .imperial").text()
            let weightMetric = try document.select(".new-athlete-bio-stats .label:contains(Weight) + .value .metric").text()
            let hometown = try document.select(".new-athlete-bio-stats .label:contains(Hometown) + .value").text()
            
            let athleteBio = AthleteBioModel(
                stance: stance,
                firstSeason: firstSeason,
                age: "\(ageImperial) \(ageMetric)",
                height: "\(heightImperial) \(heightMetric)",
                weight: "\(weightImperial) \(weightMetric)",
                hometown: hometown
            )
            
            return athleteBio
        } catch {
            print("Error parsing athlete bio information: \(error)")
            return nil
        }
    }
}
