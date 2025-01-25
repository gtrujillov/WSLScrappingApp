//
//  AthleteCardView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct AthleteCardView: View {
    
    @State var athleteName: String?
    @State var country: String?
    @State var category: String?
    @State var surferImage: String?
    
    var body: some View {
        ZStack {
            
            //MARK: - Card background
            
            CustomBackgroundView()
                .shadow(radius: 5)
            
            //MARK: - Ranking position
            
            ZStack {
                Circle()
                    .foregroundStyle(.colorGrayMedium)
                    .frame(width: 50, height: 50)
                    .offset(x: 140, y: -185)
                    .shadow(radius: 5)
            }
            
            //MARK: - Card
            
            VStack {
                Spacer()
                Text(athleteName ?? "")
                    .font(.title)
                    .foregroundColor(.colorGrayMedium)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                
                //MARK: - Avatar image
                
                ZStack {
                    Circle()
                        .fill(Color.ColorBlueSuperLight)
                        .frame(width: 170, height: 170)
                    AsyncImage(url: URL(string: surferImage ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .clipShape(Circle())
                                .foregroundStyle(.colorGreenLight)
                                .shadow(radius: 5)
                        case .failure:
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                .frame(width: 120, height: 120)
                .padding(.bottom, 8)
                
                Spacer()
                
                //MARK: - Surfer main info
                
                VStack(spacing: 5) {
                    Text(country ?? "")
                        .font(.title2)
                        .foregroundColor(.colorGrayMedium)
                    Text(category ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .padding(20)
        }
        .frame(width: 300, height: 400)
    }
}

#Preview {
    AthleteCardView(
        athleteName: "Gonzalo",
        country: "Spain",
        category: "Free surfer",
        surferImage: "https://d3qf8nvav5av0u.cloudfront.net/image/81916f3226d79e16db63d0c0c7a0079a.png"
    )
}
