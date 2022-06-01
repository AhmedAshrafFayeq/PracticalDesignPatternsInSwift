//
//  SecondViewController.swift
//  DelegationDemo
//
//  Created by Ahmed Fayeq on 01/06/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: Updatable?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func didTapUpdate(_ sender: Any) {
        delegate?.updateUI()
        navigationController?.popViewController(animated: true)
    }
    
}
