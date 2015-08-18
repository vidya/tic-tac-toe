//
//  Board.swift
//  TicTacToe
//
//  Created by Dad on 9/3/14.
//  Copyright (c) 2014 Resilia. All rights reserved.
//

import Foundation
import UIKit

class Board
{
  var squares       = [UIView](),
      notice        = UILabel()

  init()
  {
    var squareView :UIView,
    
        origin = CGPointMake(60, 140)
    
    notice.frame = CGRectMake(origin.x + 100, 20, 200, 200)
    notice.numberOfLines = 0
    
    for row in 0..<3
    {
      for col in 0..<3
      {
        squareView = UIView()
        
        squareView.frame = CGRectMake(origin.x, origin.y, 80, 80)
        
        squareView.tag = 3 * row + col
        
        squares.append(squareView)
        
        origin.x += 90
      }
      
      origin.x = 60
      origin.y += 90
    }
    
    initBoard()
  }
  
  func initBoard()
  {
    notice.text = "TicTacToe"
    
    for square in squares { square.backgroundColor = UIColor.grayColor() }
  }

  func setNotice(str: String)                      { notice.text = str }
  
  func paintSquare(squareID: Int, withColor color: UIColor)  { squares[squareID].backgroundColor = color }
}
