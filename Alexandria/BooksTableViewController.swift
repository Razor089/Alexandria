//
//  BooksTableViewController.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 02/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var bookItems = [Item?]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleBooks()
    }
    
    func loadSampleBooks() {
        let book1 = Item(name: "Il Signore degli Anelli", type: "Libro", genre: "Fantasy", author: "J.R.R. Tolkien", mine: true, suggest: false)
        
        let book2 = Item(name: "La Guerra dei Mondi", type: "Libro", genre: "Fantascienza", author: "H.G. Wells", mine: false, suggest: false)
        
        let book3 = Item(name: "Il Ciclo delle Fondazioni", type: "Libro", genre: "Fantascienza", author: "Isaac Asimov", mine: true, suggest: false)
        
        bookItems += [book1, book2, book3]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "BooksTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! BooksTableViewCell

        let book = bookItems[indexPath.row]
        
        cell.titleLabel.text = book?.name
        cell.subtitleLabel.text = book?.author

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            bookItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let viewDettagli = segue.destinationViewController as! ViewDettagli
            if let selectedBookCell = sender as? BooksTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBookCell)!
                let selectedBook = bookItems[indexPath.row]
                viewDettagli.item = selectedBook
            }
        } else if segue.identifier == "AddItem" {
            print("Add new book")
        }
    }
    
    // MARK: Actions
    
    @IBAction func unwindToBookTable(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewDettagli, item = sourceViewController.item {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                bookItems[selectedIndexPath.row] = item
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Automatic)
            } else {
                let newIndexPath = NSIndexPath(forRow: bookItems.count, inSection: 0)
                bookItems.append(item)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

}
