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
            // Capa de fondo con sombra sutil
            Color.colorGrayMedium
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                .offset(y: 15)

            // Capa intermedia con un color más suave y opacidad
            Color.colorGrayLight
                .cornerRadius(30)
                .opacity(0.8)
                .offset(y: 5)

            // Gradiente suave para un toque moderno
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.colorGreenLight,
                    Color.colorGreenMedium
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(30)
        }
    }
}

#Preview {
    CustomBackgroundView()
}
