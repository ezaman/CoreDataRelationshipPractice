//
//  VetsTableViewController.swift
//  CoreDataAssessment1272016
//
//  Created by Ehsan Zaman on 12/7/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import UIKit

class VetsTableViewController: UITableViewController {

    let store = datastore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.testData()
        store.fetch()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        store.fetch()
        tableView.reloadData()
  
    }


/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.vets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vetCell", for: indexPath)

         cell.textLabel!.text = store.vets[indexPath.row].name

        return cell
    }
    

    
}
