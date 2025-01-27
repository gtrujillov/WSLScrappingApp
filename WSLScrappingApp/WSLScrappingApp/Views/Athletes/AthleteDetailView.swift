//
//  AthleteDetailView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct AthleteDetailView: View {
    
    @StateObject private var viewModel =  AthletesBioViewModel()
    @Binding var detailUrl: String?
    @Binding var surferAvatarImg: String?
    @Binding var name: String?
    
    var body: some View {
        VStack {
            
            //MARK: - Surfer image
            
            Spacer()
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 90, height: 90)
                    AsyncImage(url: URL(string: surferAvatarImg ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                                .foregroundStyle(.colorGreenLight)
                                .shadow(radius: 5)
                        case .failure:
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 85, height: 85)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                Text(name ?? "")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding()
            
            //MARK: - Surfer info
            
            Spacer()
            
            VStack {
                VStack(alignment: .leading) {
                    Divider()
                    Text("Localización")
                        .font(.title2)
                    HStack {
                        Text("Ciudad: ")
                            .font(.custom("Poppins-SemiBold", size: 17))
                            .fontWeight(.semibold)
                        Text(viewModel.athletesBio.hometown ?? "")
                            .font(.subheadline)
                    }
                    Divider()
                    Text("Información técnica")
                        .font(.title2)
                    HStack {
                        Text("Posicion en la tabla: ")
                            .font(.custom("Poppins-SemiBold", size: 17))
                            .fontWeight(.semibold)
                        Text(viewModel.athletesBio.stance ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Primera temporada: ")
                            .font(.custom("Poppins-SemiBold", size: 17))
                            .fontWeight(.semibold)
                        Text(viewModel.athletesBio.firstSeason ?? "")
                            .font(.subheadline)
                    }
                    Divider()
                    Text("Medidas y Peso")
                        .font(.title2)
                    
                    HStack {
                        Text("Altura: ")
                            .font(.custom("Poppins-SemiBold", size: 17))
                            .fontWeight(.semibold)
                        Text(viewModel.athletesBio.height ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Peso: ")
                            .font(.custom("Poppins-SemiBold", size: 17))
                            .fontWeight(.semibold)
                        Text(viewModel.athletesBio.weight ?? "")
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .onAppear {
                Task {
                    await viewModel.loadAthletesDetail(detailUrl: detailUrl ?? "")
                }
            }
        }
        .background(Color.customGrayMedium)
        Spacer()
    }
}

#Preview {
    AthleteDetailView(
        detailUrl: .constant("https://www.worldsurfleague.com/athletes/7012/cole-houshmand"),
        surferAvatarImg: .constant(""),
        name: .constant("Alan Clealan")
    )
}
