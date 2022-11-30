//
//  ViewController.swift
//  Challenge App
//
//  Created by Emre Bakır on 21.11.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("@3x.png") {
                //this is a picture to load!
                flags.append(item)
            }
        }
        flags.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        var nameFlag = flags[indexPath.row].replacingOccurrences(of: "@3x.png", with: "", options: NSString.CompareOptions.literal, range: nil)
        cell.textLabel?.text = nameFlag.uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            vc.selectedPictureNumber = indexPath.row+1
            vc.totalPictures = flags.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    

}

