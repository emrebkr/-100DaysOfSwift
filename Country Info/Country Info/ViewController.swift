//
//  ViewController.swift
//  Country Info
//
//  Created by Emre Bakır on 8.01.2023.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        loadCountries()
        /*
        if let urlPath = Bundle.main.url(forResource: "countries", withExtension: "json") {
            if let data = try? Data(contentsOf: urlPath) {
                parse(json: data)
            }
        }
         */
    }
    
    func loadCountries(){
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json")
        else
        {
            fatalError("Unable to find JSON file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON file")
        }
        let decoder = JSONDecoder()
        guard let countries = try? decoder.decode([Country].self, from: data) else {
            fatalError("Unable to decode JSON file")
        }
        self.countries = countries.sorted { $0.name < $1.name }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let data = try? decoder.decode([Country].self, from: json) {
            countries = data
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {fatalError("Unable to instantiate DetailViewCOntroller") }
            vc.detailItem = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            title = countries[indexPath.row].name
        
    }
    
}
