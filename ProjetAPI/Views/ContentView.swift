//
//  ContentView.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 17/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var callapi = HarryPotterAPIModel()
    @State private var darkMode = false
    @State private var searchText = ""
    
    var filteredHpList: [HarryPotterAPIModel.Character] {
        if searchText.isEmpty {
            return callapi.characters
        } else {
            return callapi.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.colorHp)
                    .ignoresSafeArea()
                if callapi.isLoading {
                    ProgressView()
                } else if let error = callapi.errorMessage {
                    Text("Erreur : \(error)").foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            TextFieldView(searchText: $searchText)
                            ForEach(filteredHpList, id: \.name) { character in
                                
                                NavigationLink {
                                    CharacterDetail(character: character)
                                } label: {
                                    ImageViews(characterHp: character)
                                }

                           
                            }
                           
                            .navigationTitle("Character")
                        }
                        .padding()
                    }
                    
                }
            }
        }
        .task {
            await callapi.fetchCharacters()
        }
    }
}


#Preview {
    ContentView()
}
