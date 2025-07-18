import SwiftUI

struct TextFieldView: View {
    @Binding var searchText: String
    @State private var darkMode = false

    var body: some View {
        
        HStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search a character", text: $searchText)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(15)
            .padding()
            
        }
    }
}

#Preview {
    TextFieldView(searchText: .constant(""))
}
