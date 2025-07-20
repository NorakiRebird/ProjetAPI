import SwiftUI

struct CharacterProfileImage: View {
    let imageUrlString: String?
    let gender: String?
    
    var body: some View {
        VStack {
            if let imageUrlString,
               let url = URL(string: imageUrlString),
               url.scheme?.hasPrefix("http") == true {
                
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .shadow(color: .primary.opacity(0.3), radius: 5)
                            
                    case .failure:
                        fallbackImage
                    @unknown default:
                        fallbackImage
                    }
                }
            } else {
                fallbackImage
            }
        }
    }

    private var fallbackImage: some View {
        Image(systemName: "person.crop.circle.fill.badge.questionmark")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .foregroundColor(.primary.opacity(0.6))
    }

    
}


#Preview {
    CharacterProfileImage(
        imageUrlString: "https://hp-api.lainocs.fr/images/harry_potter.png",
        gender: "Male"
    )
}

