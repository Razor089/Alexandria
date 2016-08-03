//
//  FilmTableViewController.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 03/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit

class FilmTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        loadSampleFilm()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadSampleFilm() {
        let film1 = Film(name: "Interstellar", genre: "Fantascienza", author: "Christopher Nolan", mine: false, suggest: false)!
        let film2 = Film(name: "Il Quinto Elemento", genre: "Fantascienza", author: "Luc Besson", mine: true, suggest: false)!
        
        films += [film1, film2]
    }
    
    // MARK: Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FilmTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FilmTableViewCell
        
        let film = films[indexPath.row]
        
        cell.titleLabel.text = film.name
        cell.subtitleLabel.text = film.author
        
        if film.mine {
            cell.titleLabel.textColor = UIColor.blackColor()
            cell.subtitleLabel.textColor = UIColor.blackColor()
        } else if film.suggest {
            cell.titleLabel.textColor = UIColor.blueColor()
            cell.subtitleLabel.textColor = UIColor.blueColor()
        } else {
            cell.titleLabel.textColor = UIColor.redColor()
            cell.subtitleLabel.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            films.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowFilmDetail" {
            let viewDettagli = segue.destinationViewController as! ViewDettagli
            if let selectedCell = sender as? FilmTableViewCell {
               let indexPath = tableView.indexPathForCell(selectedCell)!
               let selectedFilm = films[indexPath.row]
               viewDettagli.film = selectedFilm
            }
        } else if segue.identifier == "AddItem" {
            print("add new item")
        }
    }
    
    // MARK: Actions
    
    @IBAction func unwindToFilmTable(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewDettagli, film = sourceViewController.film {
            print("unwindFilm")
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
               films[selectedIndexPath.row] = film
               tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Automatic)
            } else {
               let newIndexPath = NSIndexPath(forRow: films.count, inSection: 0)
               films.append(film)
               tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
        
    }
}
