//
//  ViewController.swift
//  AC5
//
//  Created by Admin on 08/02/2023.
//

import UIKit

class ViewController: UITableViewController {

    var viewModel = DogViewModel()
        var dogs:DogDataModel?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            viewModel.getDogData{ [weak self] in
                self?.dogs = self?.viewModel.dogData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            }
        }

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.dogs?.data?.count ?? 0
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let breed = self.dogs?.data?[indexPath.row].breed {
            cell.textLabel?.text = breed
        }
        return cell
    }
    
    
}
