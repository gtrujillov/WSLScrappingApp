//
//  AthleteInformationCustomView.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 27/1/25.
//

import SwiftUI

struct AthleteInformationCustomView: View {
    
    @Binding var name: String?
    @Binding var hometown: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(name ?? "Gonzalo")
                    .font(.system(
                        size: 40,
                        weight: .bold,
                        design: .default)
                    )
                    .foregroundStyle(.colorMisticBlue)
                HStack {
                    Text("28")
                        .foregroundStyle(.colorMisticBlue)
                    Text(hometown ?? "hometown")
                        .foregroundStyle(.colorMisticBlue)
                    Spacer()
                }
            }
            .padding()
            Spacer()
        }
        .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.50)
        .background(Color.white)
        .cornerRadius(20)
    }
}
