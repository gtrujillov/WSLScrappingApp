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
                    ProgressView("Cargando atletas...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 5) {
                            ForEach(viewModel.athletes, id: \.name) { athlete in
                                AthleteCardView(
                                    athleteName: athlete.name,
                                    country: athlete.country,
                                    category: athlete.category,
                                    surferImage: athlete.imageURL,
                                    detailUrl: athlete.detailUrl
                                )
                                .padding()
                            }
                        }
                        .padding()
                    }
                }
            }
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
