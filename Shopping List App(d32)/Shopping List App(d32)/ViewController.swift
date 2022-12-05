//
//  ViewController.swift
//  Shopping List App(d32)
//
//  Created by Emre Bakır on 1.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let add = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
        toolbarItems = [spacer, add]
        navigationController?.isToolbarHidden = false
    }

    @objc func refresh(){
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func addItem(){
        let ac = UIAlertController(title: "Enter the Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add an item", style: .default){
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    func submit(_ answer: String){
        let uppAnswer = answer.lowercased()
        shoppingList.insert(uppAnswer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        return
        
    }
    
    @objc func share() {
        let list = shoppingList.joined(separator: "\n")
        let avc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        present(avc, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    
    
    
}

