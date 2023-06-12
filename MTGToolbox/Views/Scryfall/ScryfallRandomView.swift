import SwiftUI

struct ScryfallRandomView: View {
    @State private var card: Card?
    
    private let apiService = ScryfallService()
    
    var body: some View {
        VStack {
            Spacer()
            if let card = card {
                AsyncImage(url: URL(string:card.imageUris.normal))
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .padding()
            } else {
                Text("Loading...")
                    .font(.title)
                    .padding()
            }
            Spacer()
            Button(action: {
                apiService.getRandomCard { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let card):
                            self.card = card
                        case .failure(let error):
                            print("Error fetching random card: \(error)")
                        }
                    }
                }
            }) {
                Text("Random Commander")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct ScryfallRandomView_Previews: PreviewProvider {
    static var previews: some View {
        ScryfallRandomView()
    }
}
