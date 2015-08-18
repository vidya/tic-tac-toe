//
//  ViewController.swift
//  TicTacToe
//
//  Created by Dad on 8/31/14.
//  Copyright (c) 2014 Resilia. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  var clickCount  = 0,
      game        = Game(),
      board       = Board()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.cyanColor()
    
    self.view.addSubview(board.notice)
    for square in board.squares { self.view.addSubview(square) }
    
    initGame()
  }

  func initGame()
  {
    game.initGame()
    
    board.initBoard()

    clickCount    = 0
  }
  
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
  {
    var touch       = touches.first! as! UITouch

    let squareNum = touch.view.tag

    game.makeMove(game.player!, move: squareNum)
    
    let color = (game.player == game.playerOne) ? UIColor.greenColor() : UIColor.orangeColor()

    board.paintSquare(squareNum, withColor: color)
    
    if game.hasVictor
    {
      if game.playerOne.isVictor()  { board.setNotice("GREEN WINS! \nShake to replay \n") }
      else                          { board.setNotice("ORANGE WINS! \nShake to replay \n") }
    }
    else
    {
      if ++clickCount >= 9          { board.setNotice("NOBODY WINS! \nShake to replay \n") }
      else                          { game.switchPlayer() }
    }
  }
  
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
  {
    if game.hasVictor
    {
      sleep(2)
    }
  }
  
  override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent)
  {
    initGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

