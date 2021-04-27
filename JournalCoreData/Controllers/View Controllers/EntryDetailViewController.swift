//
//  EntryDetailViewController.swift
//  Journal CoreData
//
//  Created by Gavin Woffinden on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - Outlets
    var entry: Entry?
    @IBOutlet weak var entryTitle: UITextField!
    @IBOutlet weak var entryBodyText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    //MARK: -  Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTitle.text, !title.isEmpty,
              let body = entryBodyText.text, !body.isEmpty
        else {return}
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: body)
        } else {
            EntryController.shared.createEntry(title: title, bodyText: body)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        entryTitle.text = ""
        entryBodyText.text = ""
    }
    
    
    //MARK: - Functions
    
    func updateViews() {
        guard let entry = entry else {return}
        entryTitle.text = entry.title
        entryBodyText.text = entry.bodyText
    }

    

}
