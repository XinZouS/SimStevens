//
//  InfoBox.swift
//  stevens
//
//  Created by Xin Zou on 11/2/16.
//  Copyright © 2016 Stevens. All rights reserved.
//

import Foundation
import SpriteKit


class InfoBox {
    var node: SKSpriteNode!
    var buttonImage:String!
    var button: SKSpriteNode!
    var closeButton: SKSpriteNode!
    
    // dialog box
    init (boxImg:String, size:CGSize, position:CGPoint, z:CGFloat, buttonImg:String) {
        
        self.node = SKSpriteNode(imageNamed: boxImg)
        self.node.size = size
        self.node.position = position
        self.node.zPosition = z
        
        self.buttonImage = buttonImg
        self.addButton()
        
        self.addCloseButton()
    }
    
    // small info box
    init (boxImg:String, size:CGSize, position:CGPoint, z:CGFloat) {
        
        self.node = SKSpriteNode(imageNamed: boxImg)
        self.node.size = size
        self.node.position = position
        self.node.zPosition = z
        
        self.button = SKSpriteNode()
        
        self.closeButton = SKSpriteNode()
    }
    
    func addButton(){
        self.button = SKSpriteNode(imageNamed: buttonImage)
        self.button.position = CGPoint(x: self.node.frame.midX, y: self.node.frame.minY+56)
        self.button.zPosition = self.node.zPosition + 1
        self.button.size = CGSize(width: 330, height: 50)
        self.node.addChild(button)
    }
    
    func addCloseButton() {
        self.closeButton = SKSpriteNode()
        self.closeButton.size = CGSize(width: 50, height: 50)
        self.closeButton.position = CGPoint(x: node.frame.maxX-23, y: node.frame.maxY-23)
        self.closeButton.zPosition = self.node.zPosition + 1
        self.node.addChild(closeButton)
    }
    
    func addTitle(text:String, fontSize:CGFloat, atPosition:CGPoint) {
        
        let title = SKLabelNode(text: text)
        title.fontSize = fontSize
        title.fontColor = UIColor.white
        title.fontName = "AmericanTypewriter-Bold"
        title.position = atPosition
        title.zPosition = self.node.zPosition + 1
        self.node.addChild(title)
        
    }
    
    func addTitle(text:String) { // use default title.
        let title = SKLabelNode(text: text)
        title.fontSize = 30
        title.fontColor = UIColor.white
        title.fontName = "AmericanTypewriter-Bold"
        title.position = CGPoint(x: self.node.frame.midX, y: self.node.frame.maxY - 33)
        title.zPosition = self.node.zPosition + 1
        self.node.addChild(title)
    }
    
    func addTextLabel(text:String, color:UIColor, fontSize:CGFloat, fontName:String, atPosition:CGPoint){
        
        let label = SKLabelNode(text: text)
        label.fontSize = fontSize
        label.fontName = fontName
        label.fontColor = color
        label.position = atPosition
        label.zPosition = self.node.zPosition + 1
        self.node.addChild(label)
        
    }
    
    func addParagraph(pText:String, numOfCharInLine:Int, color: UIColor, fontSize:CGFloat, fontName:String, initPosition:CGPoint) {
        
        let numOfcharInLineMin = max(15, numOfCharInLine) // letters at least in one line
        var idx: Int = 1
        var paragraph: [String] = [""]
        var readyToEndLine = false
        
        var newLine = " "
        paragraph.removeAll()
        for i in pText.characters.indices { // break text into lines.
            if i <= pText.characters.endIndex {
                newLine.append(pText[i])
                if idx % numOfcharInLineMin == 0 {
                    readyToEndLine = true
                }
            }
            if readyToEndLine && pText[i] == " " {
                paragraph.append(newLine)
                newLine = "" // reset newline as empty.
                readyToEndLine = false
            }
            if idx == pText.characters.count {
                newLine.append(pText[i])
                paragraph.append(newLine) // end of searching getText
                readyToEndLine = true
            }
            idx += 1
        }
        // build nodes for all lines:
        var lineOffset: CGFloat = 0
        for line in paragraph {
            lineOffset += 27
            
            let aLine = SKLabelNode(text: line)
            aLine.fontSize = 23
            aLine.fontColor = UIColor.brown
            aLine.fontName = fontName
            aLine.position = CGPoint(x: initPosition.x, y: initPosition.y - lineOffset)
            aLine.zPosition = self.node.zPosition + 1
            
            self.node.addChild(aLine)
        }
    }
    
    
    func addContent(image:String, imgSize:CGSize, atPosition:CGPoint){
        
        let content = SKSpriteNode(imageNamed: image)
        content.size = imgSize
        content.position = atPosition
        content.zPosition = self.node.zPosition + 1
        self.node.addChild(content)
        
    }

}


