import SwiftUI

struct MTGView: View {
    @State private var flipCount = 0
    @State private var isHeads = true
    @State private var rotationDegrees = 0.0
    @State private var numberOfFlips = 1
    @State private var flipResults: [Bool] = []
    
    var body: some View {
        ZStack {
            Image("krark")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
                .offset(x:-100, y: 0)
            
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("MTG Coin Flip Simulator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Flip Count: \(flipCount)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                
                CoinView(isHeads: isHeads)
                    .rotation3DEffect(
                        .degrees(rotationDegrees),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1), value: rotationDegrees)
                
                HStack {
                    Text("Number of flips:")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                    TextField("", value: $numberOfFlips, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                Button(action: {
                    flipCoins(numberOfFlips: numberOfFlips)
                }) {
                    Text("Flip Coin(s)")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }.padding()
                
                Text("Results: \(flipResults.map { $0 ? "Heads" : "Tails" }.joined(separator: ", "))")
                                    .foregroundColor(.white)
                                    .padding()
                
                Spacer()
            }.padding()
        }
    }
    
    func flipCoins(numberOfFlips: Int) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                rotationDegrees += 360 * Double(numberOfFlips)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                flipCount += numberOfFlips
                flipResults = (1...numberOfFlips).map { _ in Bool.random() }
                isHeads = flipResults.last ?? true
            }
        }
}

struct CoinView: View {
    var isHeads: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .frame(width: 200, height: 200)
            
            Text(isHeads ? "Heads" : "Tails")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct MTGView_Previews: PreviewProvider {
    static var previews: some View {
        MTGView()
    }
}
