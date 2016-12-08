//
//  HospitalsTableViewController.swift
//  CoreDataAssessment1272016
//
//  Created by Ehsan Zaman on 12/7/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import UIKit

class HospitalsTableViewController: UITableViewController {

    let store = datastore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.testData()
        store.fetch()
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
   /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.hospitals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hospitalCell", for: indexPath)
        
        let hospitalAtRow = store.hospitals[indexPath.row]
        cell.textLabel!.text = hospitalAtRow.name
        
        if let numberOfVets = hospitalAtRow.vets?.count {
        cell.detailTextLabel!.text = String(numberOfVets)
        
        }

        return cell
    }
    

}
