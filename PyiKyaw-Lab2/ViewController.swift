//
//  ViewController.swift
//  PyiKyaw-Lab2
//
//  Created by Pyi Theim Kyaw on 9/22/18.
//  Copyright © 2018 Pyi Theim Kyaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //background of pets
    @IBOutlet weak var background: UIView!
    
    //Number label outlets
    @IBOutlet weak var happinessVal: UILabel!
    @IBOutlet weak var feedVal: UILabel!
    
    //Bar outlets
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodBar: DisplayView!
    
    //image view
    @IBOutlet weak var petImage: UIImageView!
    
    var currPet:Animal! //global variable to track current Pet
    
    //Initializing certain pets with its enum value from Animal class
    let Dog = Animal(myPetType: .dog)
    let Cat = Animal(myPetType: .cat)
    let Bird = Animal(myPetType: .bird)
    let Bunny = Animal(myPetType: .bunny)
    let Fish = Animal(myPetType: .fish)
    
    //FUNCTIONS BELOW...
    //App starts off with a dog
    override func viewDidLoad() {
        super.viewDidLoad()
        currPet = Dog
        initializerForStart() //initialized view when loaded
    }
    
    //Function that contains code that will initialize the view when loaded.
    func initializerForStart() {
        
        background.backgroundColor = .blue
        happinessBar.color = .blue
        foodBar.color = .blue
        petImage.image = UIImage(named: "dog")
        happinessVal.text! = String("played: 0")
        feedVal.text! = String("fed: 0")
    }
    
    //Function to update display of labels and bar
    func updateDisplay() {
        let displayHappVal = Float(currPet.myHappiness)/10
        let displayFeedVal = Float(currPet.myFood)/10
        happinessBar.animateValue(to: CGFloat(displayHappVal))
        foodBar.animateValue(to: CGFloat(displayFeedVal))
        happinessVal.text! = String("played: \(currPet.numHapp)")
        feedVal.text! = String("fed: \(currPet.numFed)")
        petImage.image = UIImage(named: "\(currPet.petType)")
    }
    
    
    //Play Button that increases happiness level when it has enough food.
    @IBAction func playBtn(_ sender: Any) {
        currPet.iAmHappy()
        updateDisplay()
        if(currPet.myHappiness == 10) { //Bars will shake when reached max
            self.happinessBar.shake()
            print("Your happiness bar is full")
        }
    }

    //Feed Button that increases food level
    @IBAction func feedBtn(_ sender: Any) {
        currPet.iAmFed()
        updateDisplay()
        if(currPet.myFood == 10) {
            self.foodBar.shake()
            print("Your food bar is full")
        }
    }
    
    
    //Button functions below..
    @IBAction func dogBtn(_ sender: Any) {
        currPet = Dog
        background.backgroundColor = .blue

        happinessBar.color = .blue
        foodBar.color = .blue
        updateDisplay()
    }
    @IBAction func catBtn(_ sender: Any) {
        currPet = Cat
        background.backgroundColor = .purple

        happinessBar.color = .purple
        foodBar.color = .purple
        updateDisplay()
    }
    @IBAction func birdBtn(_ sender: Any) {
        currPet = Bird
        background.backgroundColor = .yellow

        happinessBar.color = .yellow
        foodBar.color = .yellow
        updateDisplay()
    }
    @IBAction func bunnyBtn(_ sender: Any) {
        currPet = Bunny
        background.backgroundColor = .orange

        happinessBar.color = .orange
        foodBar.color = .orange
        updateDisplay()
    }
    @IBAction func fishBtn(_ sender: Any) {
        currPet = Fish
        background.backgroundColor = .brown
        happinessBar.color = .brown
        foodBar.color = .brown
        updateDisplay()
    }
    
    //Button function resetAnimalBtn - will reset current animal's values
    @IBAction func resetAnimalBtn(_ sender: Any) {
        if(currPet.numFed == 0 && currPet.numHapp == 0) {
            print("Feed and Play first to reset")
        }
        else {
            currPet.resetMe()
            updateDisplay()
        }
    }
    
    @IBAction func resetAllBtn(_ sender: Any) {
        if(Dog.isPlayed() || Cat.isPlayed() || Bird.isPlayed() || Bunny.isPlayed() || Fish.isPlayed()) {
            Dog.resetMe()
            Cat.resetMe()
            Bird.resetMe()
            Bunny.resetMe()
            Fish.resetMe()
            updateDisplay()
        }
        else {
            print("You haven't fed or played yet. Can't reset.")
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//Extension of UI class that would allow the happinessBar and foodBar to shake
extension UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 8, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 8, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
