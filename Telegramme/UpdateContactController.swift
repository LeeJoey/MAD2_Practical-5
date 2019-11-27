//
//  UpdateContactController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 14/11/19.
//  Copyright © 2019 Lee Joey. All rights reserved.
//

import UIKit
import Foundation

class UpdateContactController: UIViewController {
    
    var ShowContactViewController: UITableViewController!
    var rowSelected: Int!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var controller = ContactController()
    
    @IBOutlet weak var fnlbl: UITextField!
    @IBOutlet weak var lnlbl: UITextField!
    @IBOutlet weak var mnlbl: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //let aContact = appDelegate.contactList[rowSelected]
        let contactToBeUpdated = controller.retrieveAllContact()[rowSelected]
        
        //fnlbl.text = "\(aContact.firstName)"
        fnlbl.text = "\(contactToBeUpdated.firstName)"
        
        //lnlbl.text = "\(aContact.lastName)"
        lnlbl.text = "\(contactToBeUpdated.lastName)"
        
        //mnlbl.text = "\(aContact.mobileNo)"
        mnlbl.text = "\(contactToBeUpdated.mobileNo)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        //appDelegate.contactList[rowSelected] = Contact(firstname: fnlbl.text!, lastname: lnlbl.text!, mobileno: mnlbl.text!)
        let c = Contact(firstname: fnlbl.text!, lastname: lnlbl.text!, mobileno: mnlbl.text!)
        let contactToBeUpdated = controller.retrieveAllContact()[rowSelected]
        controller.updateContact(mobileno: contactToBeUpdated.mobileNo, newContact: c)
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
