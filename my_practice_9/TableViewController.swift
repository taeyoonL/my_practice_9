//
//  TableViewController.swift
//  my_practice_9
//
//  Created by 이태윤 on 2023/07/15.
//

import UIKit

var items = ["산책하기","혁재랑 약속","개발 공부하기"]
var images = ["tree.jpeg","clock.png","computer.jpeg"]

class TableViewController: UITableViewController {
    
    
    @IBOutlet var table_view: UITableView!
    
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table_view.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: images[(indexPath as NSIndexPath).row])
        // Configure the cell...
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            images.remove(at: (indexPath as NSIndexPath).row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemtomove = items[(fromIndexPath as NSIndexPath).row]
        let imagetomove = images[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        images.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemtomove, at: (to as NSIndexPath).row)
        images.insert(imagetomove, at: (to as NSIndexPath).row)
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgdetail" {
            let cell = sender as! UITableViewCell
            let indexpath = self.table_view.indexPath(for: cell)
            let detailview = segue.destination as! detailViewController
            detailview.get_message(items[(indexpath! as NSIndexPath).row])
            self.image = UIImage(named: images[(indexpath! as NSIndexPath).row])
            detailview.get_image(self.image!)
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
