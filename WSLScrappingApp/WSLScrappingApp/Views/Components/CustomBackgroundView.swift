//
//  CustomBackground.swift
//  WSLScrappingApp
//
//  Created by Gonzalo Trujillo Vallejo on 25/1/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.colorGrayMedium
                .cornerRadius(40)
                .offset(y: 12)
            Color.colorGrayLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            LinearGradient(
                colors: [
                    Color.colorGreenMedium,
                    Color.colorGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
}
