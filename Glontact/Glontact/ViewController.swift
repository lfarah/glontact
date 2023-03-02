//
//  ViewController.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO: Move to ViewModel
        cancellable = CSVManager().loadCSV()
            .sink(receiveCompletion: { completed in
                print(completed)
            }, receiveValue: { contacts in
                print("contacts: \(contacts)")
            })
    }
}
