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
    
    
    var body: some View {
       
        VStack {
            AsyncImage(url: URL(string: characterHp.image ?? "")) { phase in
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
                        .padding()
                        
                    
                        
                        Text(characterHp.name)
                        .font(.custom("HarryPotter", size: 30))
                        .foregroundColor(.black)
                        .fontWeight(.light)
                    
                case .failure:
                    Image(systemName: "photo.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .foregroundColor(.gray)
                        .cornerRadius(12)
                @unknown default:
                    EmptyView()
                }
            }
           
        }
        .padding()
        .background(Color(darkMode ? .black : .white))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

#Preview {
    let CharacterHp = HarryPotterAPIModel.Character(
        name: "Harry Potter",
        house: "Gryffindor",
        image: nil
    )
    ImageViews(characterHp: CharacterHp)
}
