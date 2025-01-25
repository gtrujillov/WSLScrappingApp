//
//  TabBarView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            AthletesView()
                .tabItem {
                    Image(systemName: "figure.surfing")
                    Text("Surfistas")
                }
            RankingView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Ranking")
                }
            ChampionshipView()
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Campeonatos")
                }
        }
    }
}

#Preview {
    TabBarView()
}
