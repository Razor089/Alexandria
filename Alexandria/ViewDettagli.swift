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
    
    //MARK: Actions
    
    @IBAction func cancelAction(sender: UIButton) {
    }
    @IBAction func confirmAction(sender: UIButton) {
    }
    
}