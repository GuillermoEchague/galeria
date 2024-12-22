//
//  MainView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

import SwiftUI

struct MainView: View {
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient:  Gradient(colors: [Color("GradientStart"), Color("GradientEnd")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Animated title
                    Text("APP SUPER HÉROES")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                        .animation(
                            Animation.easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                        .padding(.bottom, 40)
                    
                    // Navigation buttons with enhanced style
                    NavigationLink(destination: HeroListView()) {
                        HStack {
                            Image(systemName: "person.3.fill")
                                .font(.title2)
                            Text("Ver Héroes")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("BlueColorAsset"))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                    }
                    .accessibilityIdentifier("ViewHeroesButton")
                    
                    NavigationLink(destination: CustomHeroListView()) {
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.title2)
                            Text("Elementos Personalizados")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("RedColorAsset"))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
