//
//  ViewController.swift
//  demo
//
//  Created by Fatih Doğan on 10.06.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tablewView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! CustomTableViewCell
        cell.gridView.squareCount = 100
        return cell
    }
    
    @IBAction func reload(_ sender: Any) {
        tablewView.reloadData()
    }
}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var gridView: CustomGridView!
    
}

