//
//  GameScene.swift
//  Puzzled
//
//  Created by Janak Malla on 10/11/16.
//  Copyright © 2016 Janak Malla & Max deGroot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Create FadeinFadeOutSequence
        let FIFO = SKAction.sequence([SKAction.fadeIn(withDuration: 2.0), SKAction.wait(forDuration: 2.0), SKAction.fadeOut(withDuration: 1.0)])
        let fadeIn = SKAction.fadeIn(withDuration: 1.5)
        
        //let Title = SKLabelNode(fontNamed:UIFont.systemFont(ofSize: 100, weight: UIFontWeightUltraLight).fontName)
        let Title = SKLabelNode(fontNamed:"Avenir-Light")
        let Play = SKLabelNode(fontNamed:"Avenir-Light")
        let Levels = SKLabelNode(fontNamed:"Avenir-Light")
        let HighScores = SKLabelNode(fontNamed:"Avenir-Light")
        
        Title.text = "Puzzled"; Play.text = "PLAY"; Levels.text = "Levels"; HighScores.text = "High\nScores";
        Title.alpha = 0; Title.fontSize = 100; Play.alpha = 0; Play.fontSize = 200;
        Play.position = CGPoint(x:self.frame.midX, y:(self.frame.midY)+90)
        Levels.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 150)
        HighScores.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 300)
        Levels.alpha = 0; Levels.fontSize = 60; HighScores.alpha = 0; HighScores.fontSize = 60;
        self.addChild(Title);
        Title.run(FIFO)
        
        delay(5.2) {
            self.addChild(Play); self.addChild(HighScores); self.addChild(Levels);
            Play.run(fadeIn); Levels.run(fadeIn); HighScores.run(fadeIn)
            
        }

        
        
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//titleLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            //label.run(SKAction.fadeIn(withDuration: 2.0))
//            label.run(FIFO)
//        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}

//SIMPLE DELAY FUNCTION
func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
