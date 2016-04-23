//
//  LotteryTicket.swift
//  Jackpot
//
//  Created by Belén Molina del Campo on 20/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class LotteryTicket {

    let quickPickArray: [Int] = LotteryTicket.generateTicket()
    var numberOfWinningNumbersInTicket: Int?
    var prize: Int?
    
    class func generateTicket() -> [Int]
    {
        let maxNumber = 53
        var numbersArray: [Int] = Array(1...maxNumber)
        var quickPickArrayInConstruction: [Int] = []

        for _ in 0..<6 {

            let indexOfNumberChosen = Int(arc4random_uniform(UInt32(numbersArray.count)))
            quickPickArrayInConstruction.append(numbersArray[indexOfNumberChosen])
            numbersArray.removeAtIndex(indexOfNumberChosen)
        }
        
        return quickPickArrayInConstruction
    }
    
    func checkWinningNumbers(winningNumbersArray: [Int])
    {
        numberOfWinningNumbersInTicket = 0
        for winningNumber in winningNumbersArray
        {
            if quickPickArray.contains(winningNumber)
            {
                numberOfWinningNumbersInTicket!++
            }
        }
        
        switch numberOfWinningNumbersInTicket! {
        case 0..<4:
            prize = 0
        case 4:
            prize = 1
        case 5:
            prize = 20
        case 6:
            prize = 100
        default:
            break
        }
    }
}
