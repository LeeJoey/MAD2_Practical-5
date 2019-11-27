//
//  ContactController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 18/11/19.
//  Copyright © 2019 Lee Joey. All rights reserved.
//

import UIKit
import CoreData

// Contact CRUD
class ContactController {
    
    //Add a new contact to Core Data
    func AddContact(newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let friend = NSManagedObject(entity: entity, insertInto: context)
        friend.setValue(newContact.firstName, forKeyPath: "firstname")
        friend.setValue(newContact.lastName, forKeyPath: "lastname")
        friend.setValue(newContact.mobileNo, forKeyPath: "mobileno")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Cound not save. \(error), \(error.userInfo)")
        }
    }
    
    //Retrieve all contacts from core data
    func retrieveAllContact()->[Contact]
    {
        var contactList:[Contact] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do {
            let results = try context.fetch(fetchRequest)
            
            for c in results{
                let firstname = c.value(forKeyPath: "firstname") as? String
                let lastname = c.value(forKeyPath: "lastname") as? String
                let mobileno = c.value(forKeyPath: "mobileno") as? String
                let newContact = Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!)
                contactList.append(newContact)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return contactList
    }
    
    //Update current contact with new contact
    //fetch data based on mobileno
    func updateContact(mobileno:String, newContact:Contact)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", newContact.mobileNo)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let obj = result[0] as! NSManagedObject
            
            obj.setValue(newContact.firstName, forKey: "firstname")
            obj.setValue(newContact.lastName, forKey: "lastname")
            obj.setValue(newContact.mobileNo, forKey: "mobileno")
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //Delete contact
    //fetch data based on mobileno
    func deleteContact(mobileno:String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
    
}

class FriendController {
    
    func AddFriend(newFriend:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let friend = NSManagedObject(entity: entity, insertInto: context)
        friend.setValue(newFriend.firstName, forKeyPath: "firstname")
        friend.setValue(newFriend.lastName, forKeyPath: "lastname")
        friend.setValue(newFriend.mobileNo, forKeyPath: "mobileno")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Cound not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(newfriend:Contact, thisMessage:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        
        let message = NSManagedObject(entity: entity, insertInto: context)
        message.setValue(thisMessage.date, forKeyPath: "d")
        message.setValue(thisMessage.isSender, forKeyPath: "s")
        message.setValue(thisMessage.text, forKeyPath: "t")
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "firstname = %@", newfriend.firstName)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Cound not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveMessagesbyFriend(friend:Contact) -> [Message]
    {
        var messageList:[Message] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMessage")
        
        fetchRequest.predicate = NSPredicate(format:"friend.firstname = %@", friend.firstName)
        do {
            let list:[NSManagedObject] = try context.fetch(fetchRequest)
            for m in list{
                let d = m.value(forKeyPath: "date") as! Date
                let s = m.value(forKeyPath: "isSender") as! Bool
                let t = m.value(forKeyPath: "text") as! String
                let newMessage = Message(d: d, s: s, t: t)
                messageList.append(newMessage)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return messageList
    }
}

//class ContactController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
