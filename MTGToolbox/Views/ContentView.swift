//
//  ContentView.swift
//  MTGToolbox
//  Created by Zachary Harrison on 6/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink (
                    destination: CoinFlipView()) {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("Coin Flipper")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
                NavigationLink (
                    destination: LifeCounterView()) {
                        HStack {
                            Image(systemName: "heart.text.square.fill")
                                .font(.title)
                                .foregroundColor(.red)
                            Text("Life Counter")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
                NavigationLink (
                    destination: ScryfallRandomView()) {
                        HStack {
                            Image(systemName: "dice.fill")
                                .font(.title)
                                .foregroundColor(.green)
                            Text("Scryfall Random Commander")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("MTG Toolbox", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

