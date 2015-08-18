//
//  PlayersViewController.swift
//  Ratings

import UIKit
import XLForm

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
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell
      
      let player = players[indexPath.row] as Player
      cell.nameLabel.text = player.name
      cell.gameLabel.text = player.game
      cell.ratingImageView.image = imageForRating(player.rating)
    
    var txtField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
    txtField.placeholder = ""
    txtField.text = ""
    txtField.placeholder = "\(player.game) Form"
 
    //txtField.enabled = true
    cell.actualFormItem.addSubview(txtField)
    
//    
//    var form : XLFormDescriptor
//    var section : XLFormSectionDescriptor
//    var row : XLFormRowDescriptor
//    
//    form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
//    
//    section = XLFormSectionDescriptor.formSectionWithTitle("Inline Dates") as XLFormSectionDescriptor
//    form.addFormSection(section)
//    
//    // Date
//    row = XLFormRowDescriptor(tag: "datetag", rowType: XLFormRowDescriptorTypeDateInline, title:"Date")
//    row.value = NSDate()
//    section.addFormRow(row)
//    
//    cell.actualFormItem.addSubview(form)
//    //self.form = form;
    
      return cell
  }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            players.removeAtIndex(indexPath.row) //langData is array from i delete values
            tableView.deleteRowsAtIndexPaths([indexPath],  withRowAnimation: UITableViewRowAnimation.Automatic)
        }
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
