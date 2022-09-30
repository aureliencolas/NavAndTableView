//
//  ViewController.swift
//  NavAndTableView
//
//  Created by Aurélien COLAS on 16/09/2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBAction func didTapButton(_ sender: Any) {
        show(NextScreenViewController(), sender: nil)
    }
}

