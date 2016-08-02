//
//  ViewDettagli.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 02/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit


class ViewDettagli: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var mineSwitch: UISwitch!
    @IBOutlet weak var suggestSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        authorTextField.delegate = self
        genreTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        authorTextField.resignFirstResponder()
        genreTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // Insert some code here...
    }
    
    override func didReceiveMemoryWarning() {
        // Insert some code here...
    }
    
    //MARK: Actions
    
    @IBAction func azioneConferma(sender: UIButton) {
        
        print("Modifiche effettuate")

    }
    
    
}