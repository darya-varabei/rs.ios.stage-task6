//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {

        var attackingPlayer = Player()
        var buffer: Int = 0
        
        players.forEach{ player in
            player.hand?.forEach{ card in
                let cardValue = Value.allCases.firstIndex(where: {$0 == card.value})!
                if card.isTrump && cardValue < buffer{
                    buffer = cardValue
                    attackingPlayer = player
                }
            }
        }
        return attackingPlayer
    }
}
