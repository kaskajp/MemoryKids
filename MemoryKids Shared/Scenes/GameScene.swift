//
//  GameScene.swift
//  MemoryKids Shared
//
//  Created by Jonas Raneryd Imaizumi on 2021-06-10.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        layoutScene()
        drawMemoryCards()
        addControls()
    }
    
    func layoutScene() {
        backgroundColor = UIColor.white
    }
    
    func drawMemoryCards() {
        print("Draw cards now")
        var row2x = 0
        for n in 0...5 {
            let card = SKShapeNode()
            
            card.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: frame.size.width/4, height: frame.size.width/4), cornerRadius: 64).cgPath
            card.fillColor = UIColor.gray
            
            //print(n)
            
            if n <= 2 {
                card.position = CGPoint(x: frame.minX + (CGFloat(n) * frame.size.width/4 + (frame.size.width/16 * (CGFloat(n) + 1.0))), y: frame.midY)
            } else {
                print(row2x)
                card.position = CGPoint(x: frame.minX + (CGFloat(row2x) * frame.size.width/4 + (frame.size.width/16 * (CGFloat(row2x) + 1.0))), y: frame.midY - frame.size.width/4 - frame.size.width/16)
                row2x += 1
            }
            addChild(card)
        }
        
    }
    
    func addControls() {
        let backLabel = SKLabelNode(text: "Back")
        backLabel.name = "BackButton"
        backLabel.fontName = "AvenirNext-Bold"
        backLabel.fontSize = 50.0
        backLabel.fontColor = UIColor.black
        backLabel.position = CGPoint(x: 100, y: frame.maxY-60)
        addChild(backLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "BackButton" {
                let menuScene = MenuScene(size: view!.bounds.size)
                view!.presentScene(menuScene)
            }
        }
    }

}

/*
#if os(iOS) || os(tvOS)
// Touch-based event handling
extension GameScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.green)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.blue)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.red)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.red)
        }
    }
    
   
}
#endif

#if os(OSX)
// Mouse-based event handling
extension GameScene {

    override func mouseDown(with event: NSEvent) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        self.makeSpinny(at: event.location(in: self), color: SKColor.green)
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.makeSpinny(at: event.location(in: self), color: SKColor.blue)
    }
    
    override func mouseUp(with event: NSEvent) {
        self.makeSpinny(at: event.location(in: self), color: SKColor.red)
    }

}
#endif
*/
