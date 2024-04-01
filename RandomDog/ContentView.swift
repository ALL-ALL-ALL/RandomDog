import SwiftUI

struct DogImageResponse: Codable {
    let message: String
    let status: String
}

struct ContentView: View {
    @State private var imageURL: URL?

    var body: some View {
        VStack {
            ZStack {
                Color(.yellow)
                
                // Affichage de l'image avec un indicateur de chargement
                
                if let imageURL = imageURL {
                    GeometryReader { geometry in // pour l'image "remplir"
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .frame(width: 350, height: 350)
                                .border(Color.black,width: 5)
                                .cornerRadius(40)
                                
                                .scaledToFit()
                                .frame(width: geometry.size.width, height: geometry.size.height)

                                .clipped()
                        } placeholder: {
                            ProgressView()
                        } // FIN PLACEHOLDER
                    } // FIN de geometry
                } // FIN url

                // Bouton pour charger une nouvelle image de chien
                
                Button(action: {fetchRandomDogImage()}, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 80)
                            .foregroundColor(.black)
                            .cornerRadius(40)
                                   
                        Image(systemName: "dog")
                            .font(.system(size: 40))
                            .foregroundColor(.white)

                    } // fin zstack
                    .padding(.top,500)
                    
                })
                .padding()
             
            } // FIN Zstack
        } // FIN VSTACK
        
        
        .onAppear {
            fetchRandomDogImage() // Chargez une image aléatoire lorsque la vue apparaît pour la première fois
            
        } // fin on appear
        .ignoresSafeArea()
        
    } // fin de body

    // Fonction pour récupérer une image de chien aléatoire à partir de l'API de chien
    
    func fetchRandomDogImage() {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let decodedData = try? JSONDecoder().decode(DogImageResponse.self, from: data) else {
                print("Failed to decode data")
                return
            }
            DispatchQueue.main.async {
                self.imageURL = URL(string: decodedData.message)
            }
        }.resume()
        
    } // fin de la fetch
}

#Preview {
    ContentView()
}

