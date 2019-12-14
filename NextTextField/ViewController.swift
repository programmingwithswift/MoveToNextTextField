//
//  ViewController.swift
//  NextTextField
//
//  Created by ProgrammingWithSwift on 2019/12/14.
//  Copyright © 2019 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.username.tag = 0
        self.firstname.tag = 1
        self.lastname.tag = 2
        self.email.tag = 3
        
        self.username.delegate = self
        self.firstname.delegate = self
        self.lastname.delegate = self
        self.email.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        return true
    }
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1

        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }

    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.username:
            self.firstname.becomeFirstResponder()
        case self.firstname:
            self.lastname.becomeFirstResponder()
        case self.lastname:
            self.email.becomeFirstResponder()
        default:
            self.email.resignFirstResponder()
        }
    }
}






















































