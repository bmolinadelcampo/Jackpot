//
//  LotteryTicket.swift
//  Jackpot
//
//  Created by Belén Molina del Campo on 20/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class LotteryTicket: NSObject {

    var quickPickArray: Array<Int> = []
    
    init(quickPickArray: Array<Int>) {
        super.init()
        self.quickPickArray = generateTicket()
    }
    
    func generateTicket() -> Array<Int>{
        let maxNumber = 53
        var numbersArray: [Int] = Array(0..<maxNumber)
        var quickPickArrayInConstruction: Array<Int> = []
        for _ in 0..<6 {

            let indexOfNumberChosen = Int(arc4random_uniform(UInt32(numbersArray.count)))
            quickPickArrayInConstruction.append(numbersArray[indexOfNumberChosen])
            numbersArray.removeAtIndex(indexOfNumberChosen)
        }
        
        return quickPickArrayInConstruction
    }
}


