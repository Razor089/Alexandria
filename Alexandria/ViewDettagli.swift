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
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        authorTextField.delegate = self
        genreTextField.delegate = self
        
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
        navigationItem.title = textField.text
    }
    
    override func didReceiveMemoryWarning() {
        // Insert some code here...
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = titleTextField.text ?? ""
            let author = authorTextField.text ?? ""
            let genre = genreTextField.text ?? ""
            let mine = mineSwitch.on
            let suggest = suggestSwitch.on
            
            item = Item(name: title, type: "Libro", genre: author, author: genre, mine: mine, suggest: suggest)
        }
    }
    
}