//
//  MenuScene.swift
//  MemoryKids iOS
//
//  Created by Jonas Raneryd Imaizumi on 2021-06-10.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        
        addLabels()
    }
    
    func addLabels() {
        let playLabel = SKLabelNode(text: "Play")
        playLabel.name = "PlayButton"
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.blue
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "PlayButton" {
                let gameScene = GameScene(size: view!.bounds.size)
                view!.presentScene(gameScene)
            }
        }
    }
}
