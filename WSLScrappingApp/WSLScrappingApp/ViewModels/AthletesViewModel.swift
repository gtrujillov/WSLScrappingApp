//
//  AthletesViewModel.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import Foundation

class AthletesViewModel: ObservableObject {
    @Published var athletes: [AthleteModel] = []
    @Published var isLoading: Bool = false
    
    private var scrapingService = ScrapingService()
    
    func loadAthletes() async {
        isLoading = true
        do {
            let document = try await scrapingService.fetchHTML(from: "https://www.worldsurfleague.com/athletes?tourIds[]=1")
            let athletes = scrapingService.parseAthletes(from: document)
            DispatchQueue.main.async {
                self.athletes = athletes
                self.isLoading = false
            }
        } catch {
            print("Error al cargar los atletas: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}
