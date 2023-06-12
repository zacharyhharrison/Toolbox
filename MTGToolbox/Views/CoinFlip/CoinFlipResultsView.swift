//
//  CoinFlipResultsView.swift
//  MTGToolbox
//
//  Created by Zachary Harrison on 6/11/22.
//

import SwiftUI

struct CoinFlipResultsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var coinFlipper: CoinFlipper
    @Binding var stepperValue: Int
    @Binding var krarksThumb: Bool
    @Binding var tailsSelected: Bool
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 10) {
                HeaderView(alertIsVisible: $alertIsVisible)
                    .padding(.bottom)
                ScrollView {
                    VStack (spacing: 10) {
                        ForEach(1..<stepperValue+1, id: \.self) { i in
                            let results = coinFlipper.flipCoin(krarksThumb: krarksThumb)
                            RowView(index: i, result: results, tailsSelected: $tailsSelected)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Binding var alertIsVisible: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular
                    && horizontalSizeClass == .compact
                {
                    BigBoldText(text: "Results")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Results")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    alertIsVisible = false
                }) {
                    RoundedImageViewFilled(systemName:  "xmark")
                        .padding(.trailing)
                }
            }
        }
        .padding(.top)
    }
}

struct RowView : View {
    let index: Int
    let result: [String]
    @Binding var tailsSelected: Bool
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            RoundedSelectedTextView(text: result[0], selected: shouldShowSelected(tailsSelected: tailsSelected, result: result[0]))
            if(result.count == 2)
            {
                RoundedSelectedTextView(text: result[1], selected: shouldShowSelected(tailsSelected: tailsSelected, result: result[1]))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color("LeaderboardRowColor"),
                    lineWidth:  Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Results.maxRowWidth)
    }
}

private func shouldShowSelected(tailsSelected: Bool, result: String) -> Bool {
    if (tailsSelected && result == "T") {
        return true
    } else if (!tailsSelected && result == "H") {
        return true
    } else {
        return false
    }
}

struct CoinFlipResultsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var coinFlipper = Binding.constant(CoinFlipper())
    static private var stepperValue = Binding.constant(5)
    static private var krarksThumb = Binding.constant(true)
    static private var tailsSelected = Binding.constant(true)
    
    static var previews: some View {
        CoinFlipResultsView(alertIsVisible: alertIsVisible,
                            coinFlipper: coinFlipper,
                            stepperValue: stepperValue,
                            krarksThumb: krarksThumb,
                            tailsSelected: tailsSelected)
        CoinFlipResultsView(alertIsVisible: alertIsVisible,
                            coinFlipper: coinFlipper,
                            stepperValue: stepperValue,
                            krarksThumb: krarksThumb,
                            tailsSelected: tailsSelected)
            .previewLayout(.fixed(width: 568, height: 320))
        CoinFlipResultsView(alertIsVisible: alertIsVisible,
                            coinFlipper: coinFlipper,
                            stepperValue: stepperValue,
                            krarksThumb: krarksThumb,
                            tailsSelected: tailsSelected)
            .preferredColorScheme(.dark)
        CoinFlipResultsView(alertIsVisible: alertIsVisible,
                            coinFlipper: coinFlipper,
                            stepperValue: stepperValue,
                            krarksThumb: krarksThumb,
                            tailsSelected: tailsSelected)
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 568, height: 320))
    }
}
