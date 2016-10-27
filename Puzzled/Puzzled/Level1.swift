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
    
    override func didMove(to view: SKView) {
        let Heading = SKLabelNode(fontNamed: "Avenir-Light")
        Heading.text = "Level 1: Two Sticks"; Heading.alpha = 0; Heading.fontSize = 80;
        Heading.position = CGPoint(x: self.frame.midX, y:self.frame.midY + 400)
        self.addChild(Heading); Heading.run(fadeIn);
    }
    
}
