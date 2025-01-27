//
//  AthleteDetailView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct AthleteDetailView: View {
    
    @StateObject private var viewModel = AthletesBioViewModel()
    @Binding var detailUrl: String?
    @Binding var surferAvatarImg: String?
    @Binding var name: String?
    @Binding var hometown: String?
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.customGreenLight,
                    Color.customGreenDark
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                CustomAsyncImage(
                    url: surferAvatarImg,
                    width: UIScreen.main.bounds.width / 2,
                    height: 200
                )
                .offset(x: 0, y: 95)
    
                AthleteInformationCustomView(
                    name: $name,
                    hometown: $hometown
                )
                .shadow(radius: 10)
                .padding()
                .offset(x: 0, y: 60)
                Spacer()
            }
        }
        .onAppear {
            Task {
                await viewModel.loadAthletesDetail(detailUrl: detailUrl ?? "")
            }
        }
    }
}

#Preview {
    AthleteDetailView(
        detailUrl: .constant("https://www.worldsurfleague.com/athletes/7012/cole-houshmand"),
        surferAvatarImg: .constant("https://d3qf8nvav5av0u.cloudfront.net/image/8f31239dff8203bdd5cfc4b13c9b660f.png?&x=400&y=400&icq=74&sig=d2159ee318d966804d660068db21d999"),
        name: .constant("Alan Clealan"),
        hometown: .constant("Hawaii")
    )
}
