//
//  Buildings.swift
//  stevens
//
//  Created by Xin Zou on 10/28/16.
//  Copyright © 2016 Stevens. All rights reserved.
//

import Foundation
import SpriteKit


let descriptionOf : [String:String] = [
    
    "The Gate House": "It was the grand entrance through which all guests approached the Castle, a haunting structure built for the Steven's in 1854. The Gate House remains; the Castle was demolished in 1959.",
    
    "Edwin A. Stevens Building": "Constructed in 1870 as the main building for the campus, this federally registered landmark was designed by Richard Upjohn, whose work includes the Trinity Church in Manhattan.",

    "Carnegie Laboratory": "As a trustee of Stevens Institute, Andrew Carnegie donated the funds for the Carnegie Laboratory,seen here after being built in 1902.",
    
    "Walker Gymnasium": "The William Hall Walker Gymnasium, built in 1916, is named for its donor and serves as an adjunct athletic and recreational facility.",
    
    "Burchard Building": "The Burchard Building, completed in 1958, houses the offices and facilities of electrical and computer engineering, materials engineering, physics and engineering physics.",
    
    "W.Howe Center": "The family built the Stevens Castle in the 1850s. The new family residence was designed by Alexander Jackson Davis, a prominent architect of the time. It stood on the highest point in Hoboken, on a bluff overlooking the Hudson River.",
    
    "Samuel C. Williams Library": "The Library is the center for information discovery and preservation at Stevens Institute of Technology. The Library is dedicated to fostering an innovative environment with technology, education and culture.",
    
    "Babbio Center": "The Howe School of Technology Management is one of the world’s preeminent institutions in the education of professionals who lead and manage technological innovation in businesses in America and around the world.",
    
    "Ship": "let's go to outer ocean for aventure!!!   d===(^o^)b "
]

/// for building upgrade: 
let buildingImageOf : [String:String] = [
    
    "The Gate House":           "house15",
    "Edwin A. Stevens Building": "house15",
    "Carnegie Laboratory":      "house15",
    "Walker Gymnasium":         "house15",
    "Burchard Building":        "house15",
    "W.Howe Center":            "house15",
    "Samuel C. Williams Library": "house15",
    "Babbio Center":            "house15",
    "Ship":                     "ship01"
    
]

let buildingUpgradeTimeOf : [String:TimeInterval] = [
    
    "The Gate House":           5,  // seconds
    "Edwin A. Stevens Building": 123,
    "Carnegie Laboratory":      1500,
    "Walker Gymnasium":         200,
    "Burchard Building":        2703,
    "W.Howe Center":            3603,
    "Samuel C. Williams Library": 7203,
    "Babbio Center":            14403,
    "Ship":                     5
    
]

func getIntTimeFrom(getSec:TimeInterval) -> (hor:Int, min:Int, sec:Int) {
    
    if getSec <= 0 {
        return (0,0,0)
    }
    let hor = round(getSec / 3600)
    let min = round((getSec - hor*3600) / 60)
    let sec = getSec - hor*3600 - min*60
    
    return (Int(hor), Int(min), Int(sec))

}

let buildingResearchOf : [String:String] = [
    
    "The Gate House":           "Campus Security",
    "Edwin A. Stevens Building": "Mechanical Engineering",
    "Carnegie Laboratory":      "3D printing",
    "Walker Gymnasium":         "team up! Football ducks",
    "Burchard Building":        "Communication lab",
    "W.Howe Center":            "New headquarters of Stevens",
    "Samuel C. Williams Library": "Acamedy and Fun",
    "Babbio Center":            "Finance + Business",
    "Ship":                     "我们的目标是星辰大海"
    
]

struct Building {
    var node : SKSpriteNode!
    var name : String
    var year : String
    var level: Int
    var containStudents: Int
    var upGradeCost: Float
    
    init(image:String, name:String, year:String, level:Int, numOfStudents:Int, upGradeCost: Float,
         x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat){
        self.node = SKSpriteNode(imageNamed: image)
        self.node.name = name
        self.name = name
        self.year = year
        self.level = level
        self.containStudents = numOfStudents
        self.upGradeCost = upGradeCost
        
        self.node.size = CGSize(width: width, height: height)
        self.node.position = CGPoint(x: x, y: y)
        self.node.zPosition = 2 // layer.building.rawvalue
    }
    
}






