//
//  Level0.swift
//  Puzzled
//
//  Created by Janak Malla on 10/25/16.
//  Copyright © 2016 Janak Malla & Max deGroot. All rights reserved.
//


import SpriteKit
import GameplayKit

class Level0: SKScene {
    
    let nextButton = SKSpriteNode(imageNamed: "arrow");
    
    override func didMove(to view: SKView) {
        
        //Creating and adding details to nodes
        let intro1 = SKLabelNode(fontNamed: "Avenir-Light")
        let intro2 = SKLabelNode(fontNamed: "Avenir-Light")
        let intro3 = SKLabelNode(fontNamed: "Avenir-Light")
        intro1.text = "Welcome to Puzzled!"; intro1.alpha = 0; intro1.fontSize = 70;
        intro2.text = "I will now present a series of puzzles."; intro2.alpha = 0; intro2.fontSize = 60;
        intro3.text = "Tap the arrow button to continue."; intro3.alpha = 0; intro3.fontSize = 60;
        intro1.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 400)
        intro2.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 360)
        intro3.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 320)
        
        nextButton.alpha = 0;
        nextButton.position = CGPoint(x:self.frame.midX + 400, y:self.frame.midY - 550)
        
        
        //Creating actions
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 1.0)
        let wait = SKAction.wait(forDuration: 0.5)
        let fadeIO = SKAction.repeatForever(SKAction.sequence([fadeIn, wait, fadeOut]))
        
        //Running actions and Adding Nodes
        
        self.addChild(intro1); self.addChild(intro2); self.addChild(intro3);
        intro1.run(fadeIn); intro2.run(fadeIn); intro3.run(fadeIn);
        delay(1.0) {
            self.addChild(self.nextButton); self.nextButton.run(fadeIO)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let pos = t.location(in: self)
            let node = self.atPoint(pos)
            
            if node == nextButton{
                if let view = view {
                    let scene = Level1(fileNamed:"Level1")
                    scene?.scaleMode = SKSceneScaleMode.aspectFill
                    view.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 0.3))
                }
            }
        }
    }
    
}
