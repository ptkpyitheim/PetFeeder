//
//  Dog.swift
//  PyiKyaw-Lab2
//
//  Created by Pyi Theim Kyaw on 9/23/18.
//  Copyright © 2018 Pyi Theim Kyaw. All rights reserved.
//

import Foundation

class Animal {
    //Data
    var myHappiness:Int
    var myFood:Int
    var numHapp: Int
    var numFed: Int
    var petType: petType

    //Enumeration of different types of pets
    enum petType {
        case dog
        case cat
        case bird
        case bunny
        case fish
    }

    //Initializer
    init(myPetType: petType) {
        self.petType = myPetType
        self.myHappiness = 0
        self.myFood = 0
        self.numHapp = 0
        self.numFed = 0
    }
    
    //Behavior
    //Feed the pet. Food level increases
    func iAmFed() {
        numFed += 1
        myFood += 1
        
        if (myFood > 10){
            myFood = 10
        }
    }
    
    //number of played increases. Happiness increases. Food level decreases
    func iAmHappy() {
        if(myHappiness > 10) {
            myHappiness = 10
        }
        else if (myFood > 0) {
            numHapp += 1
            myHappiness += 1
            myFood -= 1
        }
        else {
            print("Not enough food to play")
        }
    }
    
    //Resets all values back to zero
    func resetMe() {
            myHappiness = 0
            myFood = 0
            numHapp = 0
            numFed = 0
    }
    
    //Boolean function that checks if user has fed or played the animal yet
    func isPlayed() -> Bool {
        if(numFed > 0 || numHapp > 0) {
            return true
        }
        return false
    }
    
}
