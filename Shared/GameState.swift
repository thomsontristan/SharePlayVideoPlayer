//
//  GameState.swift
//  SharePlayTutorial (iOS)
//
//  Created by Tristan Thomson
//

import Foundation

enum GameState {
    case playerOneWon
    case playerTwoWon

    var title: String? {
        switch self {
        case .playerOneWon:
            return "Player 1 won!"
        case .playerTwoWon:
            return "Player 2 won!"
        }
    }
}
