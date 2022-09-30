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
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Note: reload the tableView in case a value displayed by the menu has been modified in a sub menu
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }*/

    // MARK: - Private API
    private func installTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.remembersLastFocusedIndexPath = true
    }
    
    private func reloadTableView() {
        tableView.reloadData()
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
        cell.textLabel?.text = "Item #\(indexPath.row)"
        cell.detailTextLabel?.text = detailValue ? "yes" : "no"
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        detailValue = !detailValue
        reloadTableView()
    }
}
