//
//  WinningNumbersViewController.swift
//  Jackpot
//
//  Created by Belén Molina del Campo on 21/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class WinningNumbersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let maxNumber = 53
    var winningNumberRowsArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Winning Numbers"
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return maxNumber
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("winningNumberCell", forIndexPath: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        
        if winningNumberRowsArray.contains(indexPath.row)
        {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
            if !winningNumberRowsArray.contains(indexPath.row)
            {
                if winningNumberRowsArray.count < 6
                {
                    winningNumberRowsArray.append(indexPath.row)
                }
            }
            else
            {
                let indexOfSelectedRowInWinningNumberRowsArray = winningNumberRowsArray.indexOf(indexPath.row)
                winningNumberRowsArray.removeAtIndex(indexOfSelectedRowInWinningNumberRowsArray!)
            }
            
            tableView.reloadData()
    }
}
