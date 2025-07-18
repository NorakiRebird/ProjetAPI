//
//  CharacterDetail.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 18/07/2025.
//

import SwiftUI

struct CharacterDetail: View {
    let character: HarryPotterAPIModel.Character
    @State private var darkMode = false
    
    var body: some View {
        ZStack {
            
            Color("colorHp")
                .ignoresSafeArea()
            VStack {
                if let imageUrlString = character.image, let url = URL(string: imageUrlString) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .clipShape(.circle)
                                .frame(maxWidth: 200, maxHeight: 200)
                                .shadow(color: .black, radius: 5)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                Spacer()
                Text(character.name)
                    .font(.custom("HarryPotter", size: 50))
                    .padding(.top)
               
                Spacer()
                if let house = character.house {
                    if house == "teacher" {
                        Text("Teachers")
                    } else {
                        Text("School : ")
                            .padding()
                        Text(house)
                            .font(.custom("HarryPotter", size: 50))
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CharacterDetail(character: .init(name: "Harry Potter", house: "Gryffindor", image: nil))
}
