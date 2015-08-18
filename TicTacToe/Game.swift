//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Dad on 9/3/14.
//  Copyright (c) 2014 Resilia. All rights reserved.
//

import Foundation

enum PlayerID : Int {
  case PlayerOne
  case PlayerTwo
}

func == (lhs: Player, rhs: Player) -> Bool
{
  return (lhs.id == rhs.id)
}

class Player : Hashable, Equatable
{
  let winSets = [
    // rows
    NSSet(array: [0, 1, 2]), NSSet(array: [3, 4, 5]), NSSet(array: [6, 7, 8]),
    
    // cols
    NSSet(array: [0, 3, 6]), NSSet(array: [1, 4, 7]), NSSet(array: [2, 5, 8]),
    
    // diagonals
    NSSet(array: [0, 4, 8]), NSSet(array: [2, 4, 6])
  ]

  var id      :Int,
      moves   = NSMutableSet()
  
  var hashValue: Int { return id }


  init(playerID: PlayerID)    { id = (playerID == .PlayerOne) ? 1 : 2 }
  
  func initPlayer()           { moves.removeAllObjects() }
  
  func makeMove(move: Int)    { moves.addObject(move) }
  
  func isVictor() -> Bool
  {
    for set in winSets { if set.isSubsetOfSet(moves as Set<NSObject>) { return true } }
    
    return false
  }
}

class Game
{
  var playerOne       = Player(playerID: .PlayerOne),
      playerTwo       = Player(playerID: .PlayerTwo),
  
      player          : Player!,
      hasVictor        = false
  
  init()                              { initGame() }
  
  func setPlayer(nextPlayer: Player)  { player = nextPlayer }
  
  func initGame()
  {
    player        = playerOne
    
    playerOne.initPlayer()
    playerTwo.initPlayer()
    
    hasVictor = false
  }
  
  func switchPlayer()
  {
    if (player.id == playerOne.id)  { player = playerTwo }
    else                            { player = playerOne }
  }
  
  func makeMove(player: Player, move: Int)
  {
    player.makeMove(move)
    
    hasVictor = player.isVictor()
  }

}
