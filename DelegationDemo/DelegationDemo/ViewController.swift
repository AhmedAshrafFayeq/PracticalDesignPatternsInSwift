//
//  ViewController.swift
//  DelegationDemo
//
//  Created by Ahmed Fayeq on 01/06/2022.
//

import UIKit

protocol Updatable {
    func updateUI()
}

class ViewController: UIViewController {

    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTapOk(_ sender: Any) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

extension ViewController: Updatable {
    func updateUI() {
        nameLabel.text = "Ahmed"
    }
}
