//
//  EntryController.swift
//  Journal CoreData
//
//  Created by Gavin Woffinden on 4/26/21.
//

import CoreData

class EntryController {
    //MARK: - Properties
    
    static let shared = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()

    private init() {}


    //MARK: - Functions
    func createEntry(title: String, bodyText: String) {
        Entry(title: title, bodyText: bodyText)
        CoreDataStack.saveContext()
    }
    func fetchEntries() {
        entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timeStamp = Date()
        CoreDataStack.saveContext()
    }
}
