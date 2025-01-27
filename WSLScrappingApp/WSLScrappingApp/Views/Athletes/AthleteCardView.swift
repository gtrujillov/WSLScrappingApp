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
    @State var detailUrl: String?

    var body: some View {
        NavigationLink(destination: AthleteDetailView(
            detailUrl: $detailUrl,
            surferAvatarImg: $surferImage,
            name: $athleteName
        )) {
            ZStack {
                // MARK: - Card background
                
                CustomBackgroundView()

                // MARK: - Card content
                
                VStack {
                    Text(athleteName ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                    // MARK: - Avatar image
                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 200, height: 200)
                        AsyncImage(url: URL(string: surferImage ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 190, height: 190)
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

                    // MARK: - Surfer main info
                    VStack(spacing: 5) {
                        Text(country ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(category ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
            }
            .frame(width: 270, height: 410)
            .shadow(radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    AthleteCardView(
        athleteName: "JULIA",
        country: "SPAIN",
        category: "Women surfer",
        surferImage: "https://d3qf8nvav5av0u.cloudfront.net/image/84eff49b6d9c5d431afd9b97bb023567.png"
    )
}
