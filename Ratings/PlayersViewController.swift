//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Caroline Begbie on 15/04/2015.
//  Copyright (c) 2015 Caroline Begbie. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
  
  @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    
  }
  
  @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
    if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
      
      //add the new player to the players array
      players.append(playerDetailsViewController.player)
      
      //update the tableView
      let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
      tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
  }
  
  var players: [Player] = playersData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        as! PlayerCell
      
      let player = players[indexPath.row] as Player
      cell.nameLabel.text = player.name
      cell.gameLabel.text = player.game
      cell.ratingImageView.image = imageForRating(player.rating)
      return cell
  }
  
  func imageForRating(rating:Int) -> UIImage? {
    switch rating {
    case 1:
      return UIImage(named: "1StarSmall")
    case 2:
      return UIImage(named: "2StarsSmall")
    case 3:
      return UIImage(named: "3StarsSmall")
    case 4:
      return UIImage(named: "4StarsSmall")
    case 5:
      return UIImage(named: "5StarsSmall")
    default:
      return nil
    }
  }
  
}
