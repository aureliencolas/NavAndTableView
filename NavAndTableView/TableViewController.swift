//
//  TableViewController.swift
//  NavAndTableView
//
//  Created by Aurélien COLAS on 16/09/2022.
//

import UIKit

class TableViewController: UIViewController {
    private var tableView: UITableView!
    private var detailValue = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installTableView()
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .playPause:
                updateModelAndView()
            default:()
            }
        }
        super.pressesEnded(presses, with: event)
    }
    
    // MARK: - Private API
    private func installTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.remembersLastFocusedIndexPath = true
    }
    
    private func updateModelAndView() {
        detailValue = !detailValue

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource extension
extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        //let config = UIListContentConfiguration.
        cell.textLabel?.text = "Item #\(indexPath.row)"
        cell.detailTextLabel?.text = detailValue ? "yes" : "no"
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateModelAndView()
    }
}
