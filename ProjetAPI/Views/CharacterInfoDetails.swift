import SwiftUI

struct CharacterInfoDetails: View {
    let character: HarryPotterAPIModel.Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            if let alternateNames = character.alternateNames, !alternateNames.isEmpty {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Also known as:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    ForEach(alternateNames, id: \.self) { name in
                        Text("• " + name)
                            .font(.body)
                    }
                }
            }
            if let species = character.species, !species.isEmpty {
                InfoRow(label: "Species", value: species)
            }
            if let species = character.gender, !species.isEmpty {
                InfoRow(label: "Gender", value: species)
            }
            if let ancestry = character.ancestry, !ancestry.isEmpty {
                InfoRow(label: "Ancestry", value: ancestry)
            }
            if let dateOfBirth = character.dateOfBirth, !dateOfBirth.isEmpty {
                InfoRow(label: "Date of Birth", value: dateOfBirth)
            }
            if let yearOfBirth = character.yearOfBirth {
                InfoRow(label: "Year of Birth", value: String(yearOfBirth))
            }
            if let eyeColour = character.eyeColour, !eyeColour.isEmpty {
                InfoRow(label: "Eye Colour", value: eyeColour)
            }
            if let hairColour = character.hairColour, !hairColour.isEmpty {
                InfoRow(label: "Hair Colour", value: hairColour)
            }
            if let wizard = character.wizard {
                InfoRow(label: "Wizard", value: wizard ? "Yes" : "No")
            }
            if let wand = character.wand {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Wand")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    if let wood = wand.wood, !wood.isEmpty {
                        InfoRow(label: "Wood", value: wood)
                    }
                    if let core = wand.core, !core.isEmpty {
                        InfoRow(label: "Core", value: core)
                    }
                    if let length = wand.length {
                        InfoRow(label: "Length", value: "\(length) inches")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

private struct InfoRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack(alignment: .top) {
            Text(label + ":")
                .foregroundColor(.secondary)
                .font(.subheadline)
            Spacer(minLength: 8)
            Text(value)
                .font(.body)
        }
    }
}

#Preview {
    CharacterInfoDetails(character: .init(
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
        image: nil,
        wand: HarryPotterAPIModel.Character.Wand(wood: "Holly", core: "Phoenix Feather", length: 11)
    ))
}
