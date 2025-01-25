//
//  AthletesView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct AthletesView: View {
    
    @StateObject private var viewModel =  AthletesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando atletas...") // Indicador de carga
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    List(viewModel.athletes, id: \.name) { athlete in
                        VStack(alignment: .leading) {
                            Text(athlete.name)
                                .font(.headline)
                            Text(athlete.country)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Atletas de WSL")
            .onAppear {
                Task {
                    await viewModel.loadAthletes()
                }
            }
        }
    }
}

#Preview {
    AthletesView()
}
