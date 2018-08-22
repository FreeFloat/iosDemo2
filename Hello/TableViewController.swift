//
//  TableViewController.swift
//  Hello
//
//  Created by admin on 21/8/2561 BE.
//  Copyright © 2561 admin. All rights reserved.
//

import UIKit

import Alamofire

//class TableViewController: UITableViewController {
class TableViewController: UITableViewController {
    
    let dailyTasks = ["Check all windows",
                      "Check all doors",
                      "Is the boiler fueled?",
                      "Check the mailbox",
                      "Empty trash containers",
                      "If freezing, check water pipes",
                      "Document \"strange and unusual\" occurrences",]
    
    let weeklyTasks = ["Check inside all cabins",
                       "Flush all lavatories in cabins",
                       "Walk the perimeter of property",]
    
    let monthlyTasks = ["Test security alarm",
                        "Test motion detectors",
                        "Test smoke alarms"]
    
    func fetchData(url:String){
        Alamofire.request(url).responseString(completionHandler:{ (response) in
             print(response.value ?? "no value")
            
        }).responseJSON (completionHandler:{ (response) in
            print(response.value ?? "no value")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        
        fetchData(url: "https://jsonplaceholder.typicode.com/todos")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    // AON [WITH SECTION]
        return 3
    } //Now this is not required.

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
                return self.dailyTasks.count
            case 1:
                return self.weeklyTasks.count
            case 2:
                return self.monthlyTasks.count
            default:
                return 0
        }
        
        //return 2000 // AON : #1 : Implement number of rows in the table
    }
    
    // AON : #2 : Override the tab view cellForRowAt indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // AON : #3.1 : Instantiate the cell object to show in the table view. (This this hardly use)
        //let cell = UITableViewCell()
        
        // AON : #3.1 : In case of we have very long list (many rows) we will have to use the cell that is reusable (tableView.dequeueReusableCell). It will keep the same cell object but just change the element to show. When wipe the screen up it will remove the element at the top of screen and add the element at the bottom.
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalcell") as! CustomTableViewCell
        
        
        // AON : #4 : Modify cell content at property 'textLabel'
        //cell.textLabel?.text = "Item \(indexPath.row)"
        // indexPath is the
        switch indexPath.section {
            case 0 :
                //cell.textLabel?.text = self.dailyTasks[indexPath.row]
                cell.lblName?.text = self.dailyTasks[indexPath.row]
            case 1 :
                cell.lblName?.text = self.weeklyTasks[indexPath.row]
            case 2 :
                cell.lblName?.text = self.monthlyTasks[indexPath.row]
            default:
                cell.lblName?.text = "No data"
        }
        
        // Aon : #5 : We need to return the cell to tell what cell to show in the table view
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0 :
            return "Daily Tasks"
        case 1 :
            return "Weekly Tasks"
        case 2 :
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You just selected row \(indexPath.row) on  \(indexPath.section) ")
        
//
//
//        let storyBoard = UIStoryboard(name: "Main",bundle: nil)
//        let destination: DetailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        destination.message = massage
//        self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
