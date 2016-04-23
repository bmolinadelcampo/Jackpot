//
//  ViewController.swift
//  Jackpot
//
//  Created by Belén Molina del Campo on 20/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WinningNumbersViewControllerDelegate {

    var lotteryTicketsArray: [LotteryTicket] = []
    var winningNumbersArray: [Int]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return lotteryTicketsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("quickPickCell", forIndexPath: indexPath)
        
        let currentLotteryTicket: LotteryTicket = lotteryTicketsArray[indexPath.row]
        if let winningNumbersArray = self.winningNumbersArray {
            currentLotteryTicket.checkWinningNumbers(winningNumbersArray)
        }
        
        cell.textLabel?.text = (currentLotteryTicket.quickPickArray).map { String($0)}.joinWithSeparator(" ")
        cell.detailTextLabel?.text = ""
        cell.backgroundColor = UIColor.whiteColor()
        
        if let prize = currentLotteryTicket.prize {
            switch prize {
            case 1:
                cell.backgroundColor = UIColor(red:0.94, green:1.00, blue:0.00, alpha:1.00)
            case 5:
                cell.backgroundColor = UIColor(red:1.00, green:0.81, blue:0.00, alpha:1.00)
            case 20:
                cell.backgroundColor = UIColor(red:1.00, green:0.60, blue:0.00, alpha:1.00)
            case 100:
                cell.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.00)
            default:
                break
            }
            cell.detailTextLabel?.text = "$" + String(prize)
        }
        
        return cell
    }
    
    @IBAction func addLotteryTicket(sender: AnyObject) {
        let newTicket = LotteryTicket()
        print(newTicket.quickPickArray)
        lotteryTicketsArray.append(newTicket)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWinningNumbers"
        {
        let destinationViewController = segue.destinationViewController
        (destinationViewController as! WinningNumbersViewController).delegate = self
        }
    }
    
    func didSelectWinningNumbers(winningNumberRowsArray: [Int])
    {
        winningNumbersArray = (winningNumberRowsArray.map({$0 + 1}))
        print(winningNumbersArray)
        tableView.reloadData()
    }

}

