//
//  DetailViewController.swift
//  CoreDataAssessment1272016
//
//  Created by Ehsan Zaman on 12/7/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var petName: UILabel!
    
    @IBOutlet weak var vetName: UILabel!
    
    @IBOutlet weak var hospitalName: UILabel!
    
    var pet = ""
    var vet = ""
    var hospital = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    petName.text = pet
    vetName.text = vet
    hospitalName.text = hospital
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
