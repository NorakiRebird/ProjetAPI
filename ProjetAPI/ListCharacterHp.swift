//
//  ListCharacterHp.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 18/07/2025.
//

import SwiftUI

struct ListCharacterHp: View {
    @State private var callapi = HarryPotterAPIModel()
    @State private var darkMode = false
    @State private var searchText = ""
    
    var filteredHpList: [HarryPotterAPIModel.Character] {
        return callapi.characters
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
                                ForEach(filteredHpList) { character in
                                    NavigationLink {
                                        CharacterDetail(character: character)
                                    } label: {
                                        ImageViews(characterHp: character, school: .gryffindor)
                                    }

                               
                                }
                               
                                .navigationTitle("Characters")
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
    ListCharacterHp()
}
