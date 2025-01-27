//
//  CustomAsyncImage.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 27/1/25.
//


import SwiftUI

struct CustomAsyncImage: View {
    let url: String?
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: url ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .shadow(radius: 5)
                case .failure:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: width, height: height)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
