//
//  HomeVC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 9/20/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Entry>! //instance variable of table view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

//        generateTestData()
        attemptFetch()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    //to access the configureCell function for the item
    func configureCell(cell: EntryCell, indexPath: NSIndexPath) {
        let entry = controller.object(at: indexPath as IndexPath)
        cell.configureCell(entry:entry) //configures cell with the info in the controller with core data, at the same index path
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects , objs.count > 0 {
            
            let entry = objs[indexPath.row]
            performSegue(withIdentifier: "existingEntry", sender: entry)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "existingEntry" {
            if let destination = segue.destination as? EntryVC {
                if let entry = sender as? Entry {
                    destination.entryToView = entry
                }
            }
        }
    }
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest() //fetch object
        
        let dateSort = NSSortDescriptor(key: "date", ascending: false) //how entries are sorted
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil) //the controller for entry data

        controller.delegate = self

        self.controller = controller
        
        //actual action of fetching
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("BMO: tried fetching \(error)")
        }
    }
    
    //help with updating controller with fetched results. connected to tableview
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    //help with updating controller with fetched results
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //when object is changed or updated
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! EntryCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        }
    }
    
    func generateTestData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let entry = Entry(context: context)
        entry.title = "Met the Founder of McDonalds"
        entry.content = "I was at In n Out because I was really hungry then I ended up meeting the McDonalds founder because he was trying to do market research in In n out and was wondering how it was so popular!"
        entry.date = formatter.date(from: "2017/08/20 08:01") as NSDate!
        entry.emotion = 0

        let entry2 = Entry(context: context)
        entry2.title = "Crazy Visions"
        entry2.content = "Last night I had a vision of myself in hundredfold. I was in my former residence sitting in meditation as hundred equal little kids in a row. Everyone was in deep meditation and in calmness of fulfillment. The last one seemed restless and had his eyes wide open. He wanted to go back into slumber, but his unfulfilled tasks seemed to keep him awake. I was again here as an onlooker and saw how serious I am to finish my divine duties here on earth."
        entry.date = formatter.date(from: "2017/03/06 10:19") as NSDate!
        entry.emotion = 1
        
        let entry3 = Entry(context: context)
        entry3.title = "Ghostly Eyes"
        entry3.content = "I had dream in which me and my brother were standing near the door in the yard(we live in a house) which leads to the street outside.I was holding the handle and my brother was a few steps back. it was night and everything was quiet and I decided to open the door...after I opened it I saw a bunch of people standing there who I didn't know in real life and in the center was a woman (unknown too) which said to me something like ''it won't be that easy...'' and suddenly all of the people with her grabbed my right arm and started pulling me towards them.I tried to push them away, I even tried hitting them but to no avail...after that i opened my eyes and I though that I've woken up but I couldn't control my body and I saw a beautiful ghostly-like set of eyes staring at me. My hands(absolutely no control) tried to reach the eyes while my mouth was mumbling something like ''bleeh,blaah,bleeh''. After a minute or two the eyes disappeared and i woke up completely, sweaty and shaking.I had dream in which me and my brother were standing near the door in the yard(we live in a house) which leads to the street outside.I was holding the handle and my brother was a few steps back. it was night and everything was quiet and I decided to open the door...after I opened it I saw a bunch of people standing there who I didn't know in real life and in the center was a woman (unknown too) which said to me something like ''it won't be that easy...."
        entry3.date = formatter.date(from: "2017/09/24 21:45") as NSDate!
        entry3.emotion = 2

        ad.saveContext()
    }
    
    @IBAction func addNewPostPressed(_ sender: Any) {
        performSegue(withIdentifier: "addNewPost", sender: nil)
        
    }
    
    
    @IBAction func toSettingsPressed(_ sender: Any) {
        performSegue(withIdentifier: "settings", sender: nil)
    }
    
    
    
    
    
    
    
    
    
}

