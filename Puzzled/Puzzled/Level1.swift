//
//  Level1.swift
//  Puzzled
//
//  Created by Janak Malla on 10/25/16.
//  Copyright © 2016 Janak Malla & Max deGroot. All rights reserved.
//

import SpriteKit
import GameplayKit

class Level1: SKScene {
    let fadeIn = SKAction.fadeIn(withDuration: 1.0)
    let fadeOut = SKAction.fadeOut(withDuration: 1.0)
    
    override func didMove(to view: SKView) {
        let Heading = SKLabelNode(fontNamed: "Avenir-Light")
        Heading.text = "Level 1: Two Sticks"; Heading.alpha = 0; Heading.fontSize = 80;
        Heading.position = CGPoint(x: self.frame.midX, y:self.frame.midY + 400)
        self.addChild(Heading); Heading.run(fadeIn);
        
        let explan1 = SKLabelNode(fontNamed: "Avenir-Light")
        explan1.text = "You have two distinct and equal sticks."; explan1.alpha = 0; explan1.fontSize = 40;
        explan1.position = CGPoint(x: self.frame.midX, y:self.frame.midY + 400)
        
        let stick1 = SKSpriteNode(imageNamed: "branch"); stick1.alpha = 0;
        stick1.position = CGPoint(x: self.frame.midX - 250, y: self.frame.midY)
        let stick2 = SKSpriteNode(imageNamed: "branch"); stick2.alpha = 0;
        stick2.position = CGPoint(x: self.frame.midX + 250, y: self.frame.midY)
        
        
        delay(1.0){
            Heading.run(SKAction.moveTo(y: self.frame.midY + 500, duration: 1.0))
        }
        delay(2.0){
            self.addChild(explan1); explan1.run(self.fadeIn);
        }
        delay(3.0){
            self.addChild(stick1); self.addChild(stick2);
            stick1.run(self.fadeIn); stick2.run(self.fadeIn);
        }
    }
    
}
