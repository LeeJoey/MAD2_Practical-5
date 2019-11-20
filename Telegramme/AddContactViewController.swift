//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 4/11/19.
//  Copyright © 2019 Lee Joey. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
        
        if firstNameFld.text != "" && lastNameFld.text != "" && mobileFld.text != "" {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            print(String(appDelegate.contactList.count))
            
            let c = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
            
            func AddContact() {
                .append(c)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboasrdSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
