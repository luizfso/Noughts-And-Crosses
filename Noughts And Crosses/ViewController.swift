//
//  ViewController.swift
//  Noughts And Crosses
//
//  Created by Luiz Fernando Santiago on 10/8/15.
//  Copyright © 2015 Luiz Fernando Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = nougths, 2 = crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
    
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        var buttonClear : UIButton
        
        for var i = 0; i < 9; i++ {
        
            buttonClear = view.viewWithTag(i) as! UIButton
            
            buttonClear.setImage(nil, forState: .Normal)
            
        }
    
    }
    
    
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressend(sender: AnyObject) {
   
        print(gameState)
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
        
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1{
        
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            
                activePlayer = 2
                
            }
            else{
        
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
                activePlayer = 1
            }
            
            for combination in winningCombination{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                    
                        print("Nougths has Won !")
                        
                        gameOverLabel.text = "Nougths have Won !"
                        
                    } else{
                        print("Crosses has Won !")
                        
                        gameOverLabel.text = "Crosses have Won !"
                    }
                    
                    
                    
                    endGame()
                }
                
            }
            
            if gameActive == true {
                
                gameActive = false
            
                for buttonState in gameState {
            
                    if buttonState == 0{
                        gameActive = true
                    }
                }
            
                if gameActive == false{
            
                    gameOverLabel.text = "It's a Draw !"
                
                    endGame()
                }
            
            }
        }
        
    }
    
    func endGame(){
    
        gameOverLabel.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
        })
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

