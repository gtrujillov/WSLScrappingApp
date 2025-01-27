//
//  AthletesBioViewModel.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 26/1/25.
//

import Foundation

class AthletesBioViewModel: ObservableObject {
    
    @Published var athletesBio = AthleteBioModel()
    private var scrapingService = ScrapingService()
    
    func loadAthletesDetail(detailUrl: String) async {
        do {
            let document = try await scrapingService.fetchHTML(from: detailUrl)
            guard let athletesBio = scrapingService.parseAthletesBioInfo(from: document) else { return }
            DispatchQueue.main.async {
                self.athletesBio = athletesBio
            }
        } catch {
            print("Error al cargar los atletas: \(error)")
        }
    }
}
