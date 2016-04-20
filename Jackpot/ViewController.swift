//
//  ViewController.swift
//  Jackpot
//
//  Created by Belén Molina del Campo on 20/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var lotteryTicketsArray: Array<LotteryTicket> = []
    
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
        let currentTicket: [Int] = (lotteryTicketsArray[indexPath.row].quickPickArray)
        cell.textLabel?.text = currentTicket.map { String($0)}.joinWithSeparator(" ")

        return cell
    }
    
    @IBAction func addLotteryTicket(sender: AnyObject) {
        let newTicket = LotteryTicket()
        print(newTicket.quickPickArray)
        lotteryTicketsArray.append(newTicket)
        tableView.reloadData()
    }

}

