import SwiftUI

struct CoinFlipView: View {
    @State private var resultsAreVisible = false
    @State private var stepperValue = 1
    @State private var coinFlipper = CoinFlipper()
    @State private var krarksThumb = false
    @State private var tailsSelected = true

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Call it!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(spacing: 10) {
                    Text("Heads or Tails?")
                        .font(.title)
                    CoinPicker(tailsSelected: $tailsSelected)
                }
                
                Toggle(isOn: $krarksThumb) {
                    Text("Krark's Thumb?")
                        .font(.title)
                }
                
                Stepper(value: $stepperValue, in: 1...69, step: 1) {
                    Text("Flip \(stepperValue) coins")
                        .font(.title)
                }
                
                CoinFlipButton(
                    resultsAreVisible: $resultsAreVisible,
                    coinFlipper: $coinFlipper,
                    stepperValue: $stepperValue,
                    krarksThumb: $krarksThumb,
                    tailsSelected: $tailsSelected)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct CoinFlipButton: View {
    @Binding var resultsAreVisible: Bool
    @Binding var coinFlipper: CoinFlipper
    @Binding var stepperValue: Int
    @Binding var krarksThumb: Bool
    @Binding var tailsSelected: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                resultsAreVisible = true
            }
        }) {
            Text("Flip".uppercased())
                .bold()
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding(20.0)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .fill(Color.accentColor)
                        .opacity(0.9)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
                )
        }
        .sheet(
            isPresented: $resultsAreVisible,
            onDismiss: {},
            content: {
                CoinFlipResultsView(
                    alertIsVisible: $resultsAreVisible,
                    coinFlipper: $coinFlipper,
                    stepperValue: $stepperValue,
                    krarksThumb: $krarksThumb,
                    tailsSelected: $tailsSelected
                )
            }
        )
    }
}


struct CoinPicker: View {
    @Binding var tailsSelected: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                tailsSelected = false
            }) {
                RoundedSelectedTextView(text: "H", selected: !tailsSelected)
            }
            
            Button(action: {
                tailsSelected = true
            }) {
                RoundedSelectedTextView(text: "T", selected: tailsSelected)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CoinFlipView_Previews: PreviewProvider {
    static var previews: some View {
        CoinFlipView()
    }
}
