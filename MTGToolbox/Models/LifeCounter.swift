//
//  GameState.swift
//  MTGToolbox
//
//  Created by Zachary Harrison on 6/11/22.
//

import Foundation

final class LifeCounter: ObservableObject {
    @Published var health1: Int {
        didSet {
            wasReseted = false
        }
    }
    @Published var health2: Int{
        didSet {
            wasReseted = false
        }
    }
    
    var initialHealth: Int
    
    private var wasReseted = false
    private var prevHealth1: Int?
    private var prevHealth2: Int?
    
    var canReset: Bool {
        health2 != initialHealth || health1 != initialHealth
    }
    
    init() {
        initialHealth = 40
        health1 = initialHealth
        health2 = initialHealth
    }
    
    func resetHealth() {
        prevHealth1 = health1
        prevHealth2 = health2
        
        health2 = initialHealth
        health1 = initialHealth
        
        wasReseted = true
    }
}

