//
//  ImageViews.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 18/07/2025.
//

import SwiftUI

struct ImageViews: View {
    let characterHp: HarryPotterAPIModel.Character
    @State private var searchText = ""
    @State private var darkMode = false
    let school: School?
    var fallbackImage: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
            .foregroundColor(.gray)
            .cornerRadius(12)
    }
    
    
    var body: some View {
        
        VStack {
            let validImageUrlString = (characterHp.image?.isEmpty == false && URL(string: characterHp.image!)?.scheme?.hasPrefix("http") == true)
                ? characterHp.image!
                : "https://hp-api.lainocs.fr/images/harry_potter.png"
            if let url = URL(string: validImageUrlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(16)
                            .frame(height: 300)
                            .clipped()
                            .clipShape(.circle)
                            .padding()
                            .shadow(color: .primary, radius: 5)
                    case .failure:
                        fallbackImage
                    @unknown default:
                        fallbackImage
                    }
                }
                
                HStack {
                    Text(characterHp.name)
                        .foregroundColor(.primary)
                        .font(.custom("HarryPotter", size: 30))
                    Text(characterHp.dateOfBirth ?? "No birth date")
                        .foregroundColor(.primary)
                }
            } else {
                fallbackImage
            }
        }
        
    }
    
}
#Preview {
    let CharacterHp = HarryPotterAPIModel.Character(
        id: "1",
        name: "Harry Potter",
        alternateNames: ["The Boy Who Lived"],
        species: "human",
        gender: "male",
        house: "Gryffindor",
        dateOfBirth: "31-07-1980",
        yearOfBirth: 1980,
        wizard: true,
        ancestry: "half-blood",
        eyeColour: "green",
        hairColour: "black",
        image: "https://ik.imagekit.io/hpapi/harry.jpg",

        wand: .init(wood: "holly", core: "phoenix feather", length: 11.0)
    )
    ImageViews(characterHp: CharacterHp, school: .gryffindor)
}

