//
//  NextScreenViewController.swift
//  NavAndTableView
//
//  Created by Aurélien COLAS on 16/09/2022.
//

import UIKit

class NextScreenViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    
    private let navController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        installNavigationController()
        navController.pushViewController(TableViewController(), animated: true)
    }
    
    private func installNavigationController() {
        navController.view.clipsToBounds = false
        navController.isNavigationBarHidden = true
        installChildViewController(navController, in: containerView)
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
