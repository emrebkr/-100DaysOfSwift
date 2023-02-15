//
//  GameScene.swift
//  Milestone16-18
//
//  Created by Emre Bakır on 16.01.2023.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var timeLabel: SKLabelNode!
    var timeRemaining = 60 {
        didSet {
            timeLabel.text = "Time: \(timeRemaining)"
        }
    }
    var rounds: Int = 0
    var popupTime = 1
    var bullet = 6
    var gameScore: SKLabelNode!
    var gameTimer: Timer?
    var reloadLabel: SKLabelNode!
    var ducks = [SKSpriteNode]()
    var wood = SKSpriteNode(imageNamed: "wood")
    var wood2 = SKSpriteNode(imageNamed: "wood")
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
            reloadLabel.text = "Bullet: \(bullet)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        gameTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        
        RunLoop.main.add(gameTimer!, forMode: .common)
        
        let background = SKSpriteNode(imageNamed: "backg")
        background.size.width = 2048
        background.size.height = 1536
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        timeLabel = SKLabelNode(fontNamed: "Chalkduster")
        timeLabel.text = "Time: \(timeRemaining)"
        timeLabel.position = CGPoint(x: 512, y: 700)
        addChild(timeLabel)
        runTimer()
        
        
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 8, y: 8)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 48
        addChild(gameScore)
        
        wood.position = CGPoint(x: 0, y: 200)
        wood.size.height = 300
        wood.size.width = 2048
        addChild(wood)
        
        wood2.position = CGPoint(x: 0, y: 500)
        wood2.size.height = 300
        wood2.size.width = 2048
        addChild(wood2)
        
        reloadLabel = SKLabelNode(fontNamed: "Chalkduster")
        reloadLabel.text = "Bullet: \(bullet)"
        reloadLabel.position = CGPoint(x: 1000, y: 8)
        reloadLabel.fontSize = 48
        reloadLabel.horizontalAlignmentMode = .right
        addChild(reloadLabel)
        
    }
        
    func runTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.removeAllDucks()
            }
        }
        timer.fire()
    }

    func removeAllDucks() {
        for duck in ducks {
            duck.removeFromParent()
        }
        ducks.removeAll()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        
        if bullet > 0 {
            if touchedNode.name == "duck" {
                touchedNode.removeFromParent()
                ducks.removeAll(where: { $0 == touchedNode })
                bullet -= 1
                score += 1
                updateBulletLabel()
            } else {
                bullet -= 1
                updateBulletLabel()
            }
        } else if bullet == 0 {
            reloadLabel.text = "Reloading"
            reloadLabel.isHidden = false
            reloadBullets()
        }
    }
    
        func reloadBullets() {
            self.isUserInteractionEnabled = false
            // Reload bullets with 5 second delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.bullet = 6
                self.reloadLabel.isHidden = true
                self.isUserInteractionEnabled = true
                self.reloadLabel.text = "Bullets: \(self.bullet)"
                self.reloadLabel.isHidden = false
            }
        }

        func updateBulletLabel() {
            reloadLabel.text = "Bullets: \(bullet)"
        }
    
    func updateScoreLabel() {
        //Update score label
    }
    
    @objc func createEnemy() {
        
        var yPositions =  [CGFloat]()
        yPositions.append(250)
        yPositions.append(550)
        
        if ducks.count < 10 { // limit maximum number of ducks on screen
            let duck = SKSpriteNode(imageNamed: "duck")
            let yPositions = [250, 550]
            duck.position = CGPoint(x: CGFloat.random(in: 0...view!.frame.width), y: CGFloat(yPositions.randomElement()!))
            duck.name = "duck"
            addChild(duck)
            ducks.append(duck)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for duck in ducks {
            let moveDuck = SKAction.moveBy(x: CGFloat.random(in: -100...100), y: 0, duration: 1)
            duck.run(moveDuck)
        }
    }
}
