//
//  TableVC.swift
//  JSONParsingDemo
//
//  Created by Tops on 1/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {
    
    let reuseIdentifier = "myCell"
    var maiarray=NSMutableArray()

    //let strURL = "http://api.kivaws.org/v1/loans/newest.json"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //loan=NSMutableArray.init()
        let url = URL(string:"http://api.kivaws.org/v1/loans/newest.json")
        let data = NSData(contentsOf: url!)
        
        do
        {
            let dict=try JSONSerialization.jsonObject(with: data! as Data, options: []) as! NSDictionary
            for i in 0 ..< (dict.value(forKey: "loans") as! NSArray).count
            {
                maiarray.add((dict.value(forKey: "loans") as! NSArray).object(at: i))
            }
            print(maiarray)
            
            
        }
        catch
        {
            print("SOmthing...")
        }
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return maiarray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableCell

        cell.nameLabel.text = (maiarray[indexPath.row] as AnyObject).value(forKey: "name") as? String
        cell.townLabel.text = ((maiarray[indexPath.row] as AnyObject).value(forKey: "location") as AnyObject).value(forKey: "country") as? String
        cell.countryLabel.text = ((maiarray[indexPath.row] as AnyObject).value(forKey: "location") as AnyObject).value(forKey: "town") as? String

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        headerView.backgroundColor = UIColor.gray
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "List of Debtors"
        }
        return ""
    }
    
    

    
    

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
