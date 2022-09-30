//
//  ViewController.swift
//  NavAndTableView
//
//  Created by Aurélien COLAS on 16/09/2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var containerView: UIView!
    
    private let tableViewController = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installChildViewController(tableViewController, in: containerView)
    }
    
    private func installChildViewController(_ childVC: UIViewController, in containerView: UIView? = nil) {
        let containerView: UIView = containerView ?? view
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = CGRect(origin: .zero, size: containerView.bounds.size)
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childVC.didMove(toParent: self)
    }
}
