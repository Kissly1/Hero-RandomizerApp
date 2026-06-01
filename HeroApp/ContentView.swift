//
//  ContentView.swift
//  HeroApp
//
//  Created by Alexandr Kisslitsyn on 07.03.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HeroViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Hero...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 20) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text("Error")
                            .font(.headline)
                        Text(errorMessage)
                        Button("Try Again") {
                            Task {
                                await viewModel.loadRandomHero()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else if let hero = viewModel.hero {
                    ScrollView {
                        VStack(spacing: 16) {
                            // Hero Image
                            AsyncImage(url: URL(string: hero.images.lg)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 300)
                                        .cornerRadius(10)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                        .frame(height: 300)
                                } else {
                                    ProgressView()
                                        .frame(height: 300)
                                }
                            }
                            
                            // Hero Name
                            Text(hero.name)
                                .font(.title)
                                .bold()
                            
                            Text(hero.biography.fullName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            // Powerstats
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Powerstats")
                                    .font(.headline)
                                
                                HStack {
                                    Text("Intelligence:")
                                    Spacer()
                                    Text("\(hero.powerstats.intelligence)")
                                }
                                
                                HStack {
                                    Text("Strength:")
                                    Spacer()
                                    Text("\(hero.powerstats.strength)")
                                }
                                
                                HStack {
                                    Text("Speed:")
                                    Spacer()
                                    Text("\(hero.powerstats.speed)")
                                }
                                
                                HStack {
                                    Text("Durability:")
                                    Spacer()
                                    Text("\(hero.powerstats.durability)")
                                }
                                
                                HStack {
                                    Text("Power:")
                                    Spacer()
                                    Text("\(hero.powerstats.power)")
                                }
                                
                                HStack {
                                    Text("Combat:")
                                    Spacer()
                                    Text("\(hero.powerstats.combat)")
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            
                            // Appearance
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Appearance")
                                    .font(.headline)
                                
                                HStack {
                                    Text("Gender:")
                                    Spacer()
                                    Text(hero.appearance.gender)
                                }
                                
                                HStack {
                                    Text("Race:")
                                    Spacer()
                                    Text(hero.appearance.race ?? "Unknown")
                                }
                                
                                HStack {
                                    Text("Height:")
                                    Spacer()
                                    Text(hero.appearance.height.first ?? "Unknown")
                                }
                                
                                HStack {
                                    Text("Weight:")
                                    Spacer()
                                    Text(hero.appearance.weight.first ?? "Unknown")
                                }
                                
                                HStack {
                                    Text("Eye Color:")
                                    Spacer()
                                    Text(hero.appearance.eyeColor)
                                }
                                
                                HStack {
                                    Text("Hair Color:")
                                    Spacer()
                                    Text(hero.appearance.hairColor)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            
                            // Biography
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Biography")
                                    .font(.headline)
                                
                                HStack {
                                    Text("Publisher:")
                                    Spacer()
                                    Text(hero.biography.publisher)
                                }
                                
                                HStack {
                                    Text("Alignment:")
                                    Spacer()
                                    Text(hero.biography.alignment.capitalized)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Place of Birth:")
                                        .bold()
                                    Text(hero.biography.placeOfBirth)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            
                            // Work
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Work")
                                    .font(.headline)
                                
                                VStack(alignment: .leading) {
                                    Text("Occupation:")
                                        .bold()
                                    Text(hero.work.occupation)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            
                            // Randomize Button
                            Button("Randomize Hero") {
                                Task {
                                    await viewModel.loadRandomHero()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.vertical)
                        }
                        .padding()
                    }
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 60))
                        Text("No hero loaded")
                        Button("Load Random Hero") {
                            Task {
                                await viewModel.loadRandomHero()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .navigationTitle("Hero Randomizer")
        }
        .task {
            await viewModel.loadRandomHero()
        }
    }
}

#Preview {
    ContentView()
}
