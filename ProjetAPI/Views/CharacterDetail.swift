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
                CharacterProfileImage(
                    imageUrlString: character.image,
                    gender: character.gender
                )
                
               
                Text(character.name)
                    .font(.custom("HarryPotter", size: 50))
                    .padding(.top)
               
                ScrollView(showsIndicators: false) {
                    CharacterHouseSection(
                        house: character.house,
                        school: character.school
                    )
                }
                
                CharacterInfoDetails(character: character)
               
                Spacer()
            
                
              
                Spacer()
            }
        }
    }
}

#Preview {
    CharacterDetail(character: .init(
        id: "1",
        name: "Harry Potter",
        alternateNames: ["The Boy Who Lived", "The Chosen One"],
        species: "Human",
        gender: "Male",
        house: "Gryffindor",
        dateOfBirth: "31-07-1980",
        yearOfBirth: 1980,
        wizard: true,
        ancestry: "Half-blood",
        eyeColour: "Green",
        hairColour: "Black",
        image: "https://ik.imagekit.io/hpapi/harry.jpg",
        wand: HarryPotterAPIModel.Character.Wand(wood: "Holly", core: "Phoenix Feather", length: 11)
    ))
}
