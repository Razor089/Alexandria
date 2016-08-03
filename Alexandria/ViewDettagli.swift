//
//  ViewDettagli.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 02/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit


class ViewDettagli: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var mineSwitch: UISwitch!
    @IBOutlet weak var suggestSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var libro: Libro?
    var film: Film?
    var sourceIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        authorTextField.delegate = self
        genreTextField.delegate = self
        
        if let libro = libro {
            titleTextField.text = libro.name
            authorTextField.text = libro.author
            genreTextField.text = libro.genre
            mineSwitch.setOn(libro.mine, animated: true)
            suggestSwitch.setOn(libro.suggest, animated: true)
            navigationItem.title = libro.name
            sourceIndex = 0
        } else if let film = film {
            titleTextField.text = film.name
            authorTextField.text = film.author
            genreTextField.text = film.genre
            mineSwitch.setOn(film.mine, animated: true)
            suggestSwitch.setOn(film.suggest, animated: true)
            navigationItem.title = film.name
            sourceIndex = 1
        }
        
        checkTitleNotNull()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        authorTextField.resignFirstResponder()
        genreTextField.resignFirstResponder()
        return true
    }
    
    // MARKS: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkTitleNotNull() {
        let text = titleTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkTitleNotNull()
        //navigationItem.title = textField.text
    }
    
    override func didReceiveMemoryWarning() {
        // Insert some code here...
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentedInAddItemMode = presentingViewController is UITabBarController
        
        print("Is presented in Add item Mode: ", isPresentedInAddItemMode, " ", presentingViewController.debugDescription)
        if isPresentedInAddItemMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = titleTextField.text ?? ""
            let author = authorTextField.text ?? ""
            let genre = genreTextField.text ?? ""
            let mine = mineSwitch.on
            let suggest = suggestSwitch.on
            
            print(presentingViewController)
            
            switch sourceIndex {
            case 0?:
                libro = Libro(name: title, genre: genre, author: author, mine: mine, suggest: suggest)
                break
            case 1?:
                film = Film(name: title, genre: genre, author: author, mine: mine, suggest: suggest)
                self.performSegueWithIdentifier("returnToFilm", sender: self)
                break
            default:
                break
            }
            
            if let tabBar = presentingViewController as? UITabBarController {
                switch tabBar.selectedIndex {
                case 0:
                    libro = Libro(name: title, genre: genre, author: author, mine: mine, suggest: suggest)
                    break
                case 1:
                    film = Film(name: title, genre: genre, author: author, mine: mine, suggest: suggest)
                    self.performSegueWithIdentifier("returnToFilm", sender: self)
                    break
                default:
                    break
                }
                
            }
            
        }
    }
    
}