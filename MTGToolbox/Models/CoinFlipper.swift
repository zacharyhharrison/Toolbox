//
//  CoinFlipper.swift
//  MTGToolbox
//
//  Created by Zachary Harrison on 6/11/22.
//

import Foundation

struct CoinFlipper {
    func flipCoin(krarksThumb: Bool) -> [String] {
        var resultsList: [String] = []
        if krarksThumb {
            resultsList.append(flipCoin())
            resultsList.append(flipCoin())
        } else {
            resultsList.append(flipCoin())
        }
        return resultsList
    }
    
    private func flipCoin() -> String {
        let flip = Int.random(in: 1...2)
        if flip == 1 {
            return "T"
        } else {
            return "H"
        }
    }
}
