//
//  HeroRowView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation
import SwiftUI

struct HeroRowView: View {
    let hero: Hero // Modelo del héroe que este componente mostrará

    var body: some View {
        HStack(spacing: 16) {
            // Imagen del héroe
            AsyncImage(url: URL(string: hero.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80) // Tamaño de la imagen
            .clipShape(RoundedRectangle(cornerRadius: 10))

            // Información del héroe
            VStack(alignment: .leading, spacing: 4) {
                Text(hero.nombre)
                    .font(.headline)

                Text("Primera aparición:")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(hero.primeraAparicion)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}
