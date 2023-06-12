import SwiftUI

struct LifeCounterView: View {
    @StateObject private var state = LifeCounter()

    var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    playerBoard(life: $state.health1, backgroundColor: .red).rotationEffect(.degrees(180))
                    playerBoard(life: $state.health2, backgroundColor: .white)
                }
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea()
                .navigationBarHidden(true)
                
                // Reset button
                VStack {
                    Spacer()
                    Button(action: {
                        UISelectionFeedbackGenerator().selectionChanged()
                        state.resetHealth()
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding()
                            .padding(.top, -20) 
                    }
                    Spacer()
                }
            }
        }

    func playerBoard(life: Binding<Int>, backgroundColor: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(backgroundColor)
                .padding()

            VStack {
                Spacer()

                HStack {
                    Spacer()

                    Text("\(life.wrappedValue)")
                        .font(.system(size: 200))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)

                    Spacer()
                }
                Image(systemName: "heart.fill")
                    .font(.system(size: 50.0))

                Spacer()
            }

            HStack {
                Button(action: {
                    UISelectionFeedbackGenerator().selectionChanged()
                    life.wrappedValue -= 1
                }) {
                    Color.clear.frame(width: 100, height: 400)
                }
                Spacer()
                Button(action: {
                    UISelectionFeedbackGenerator().selectionChanged()
                    life.wrappedValue += 1
                }) {
                    Color.clear.frame(width: 100, height: 400)
                }
            }
            .padding(.bottom)
        }
    }

}

struct LifeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        LifeCounterView()
    }
}
