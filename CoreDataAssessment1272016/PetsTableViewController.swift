//
//  PetsTableViewController.swift
//  CoreDataAssessment1272016
//
//  Created by Ehsan Zaman on 12/7/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import UIKit

class PetsTableViewController: UITableViewController {

     let store = datastore.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.testData()
        store.fetch()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        store.fetch()
        tableView.reloadData()
    }

    // MARK: - Table view data source
   /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    } */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath)

        cell.textLabel!.text = store.pets[indexPath.row].name

        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "petFacts" {
            if let destVC = segue.destination as? DetailViewController{
                let indexpath = tableView.indexPathForSelectedRow
                if let pet = store.pets[indexpath!.row].name {
                    destVC.pet = pet
                }
                if let vet = store.pets[indexpath!.row].vet?.name{
                    destVC.vet = vet
                }
                if let hospital  = store.pets[indexpath!.row].hospital?.name{
                    destVC.hospital = hospital
                }
            }
        }
    }
    

}
