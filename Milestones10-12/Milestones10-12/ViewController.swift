//
//  ViewController.swift
//  Milestones10-12
//
//  Created by Emre Bakır on 26.12.2022.
//

import UIKit

class ViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //nav controller imageviewcontroller and init
    //barbutton items
    //save + load
    //table view funcs
    //picker added barbutton designed and picker func didfinishpickingmediainfo
    //imageviewcontroller düzenle
    //didselectrowat
    
    var custom = [Custom]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture Opener"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
    
        
        //Codable
        let defaults = UserDefaults.standard
        if let savedImages = defaults.object(forKey: "custom") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                custom = try jsonDecoder.decode([Custom].self, from: savedImages)
            } catch {
                print("Failed to load images")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return custom.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoID", for: indexPath)
        let photo = custom[indexPath.item]
        let path = getDocumentsDirectory().appendingPathComponent(custom[indexPath.row].filename)
        cell.imageView?.image = UIImage(contentsOfFile: path.path)
        cell.textLabel?.text = custom[indexPath.row].caption
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Custom") as? ImageViewController {
            vc.picture = custom[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //picker funcs: addPhoto for barbutton item, didFinishPickingMediaWithInfo and getDocumentsDirectory
    
    
    @objc func addPhoto() {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
        
        let ac = UIAlertController(title: "Enter Caption", message: "Enter a caption for the picture", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] action in
            guard let newCaption = ac?.textFields![0].text else { return }
            let picture = Custom(filename: imageName, caption: newCaption)
            self?.custom.append(picture)
            self?.save()
            self?.tableView.reloadData()
        })
        present(ac, animated: true)
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
        
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(custom) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "custom")
        } else {
            print("Failed to save images")
        }
    }

}

