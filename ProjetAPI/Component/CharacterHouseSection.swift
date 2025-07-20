import SwiftUI
import Foundation

struct CharacterHouseSection: View {
    let house: String?
    let school: School?

    var body: some View {
        Group {
            if let house {
                if house.lowercased() == "teacher" {
                    Text("Teachers")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                } else {
                    VStack(spacing: 6) {
                        Text("House :")
                            .foregroundColor(.secondary)
                            .font(.headline)
                        if let school {
                            Image(school.emblem)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .shadow(color: .black, radius: 6)
                                .padding(.vertical, 8)
                        }
                        Text(house)
                            .font(.custom("HarryPotter", size: 36))
                            .fontWeight(.medium)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                }
            }
        }
    }
}

#Preview {
    CharacterHouseSection(house: "Gryffindor", school: .gryffindor)
}
