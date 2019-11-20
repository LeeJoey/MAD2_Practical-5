//
//  UpdateContactController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 14/11/19.
//  Copyright © 2019 Lee Joey. All rights reserved.
//

import UIKit

class UpdateContactController: UIViewController {
    
    var ShowContactViewController: UITableViewController!
    var rowSelected: Int!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var fnlbl: UITextField!
    @IBOutlet weak var lnlbl: UITextField!
    @IBOutlet weak var mnlbl: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let aContact = appDelegate.contactList[rowSelected]
        
        fnlbl.text = "\(aContact.firstName)"
        
        lnlbl.text = "\(aContact.lastName)"
        
        mnlbl.text = "\(aContact.mobileNo)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        appDelegate.contactList[rowSelected] = Contact(firstname: fnlbl.text!, lastname: lnlbl.text!, mobileno: mnlbl.text!)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
