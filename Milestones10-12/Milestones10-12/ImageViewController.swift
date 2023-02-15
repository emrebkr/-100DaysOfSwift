//
//  ImageViewController.swift
//  Milestones10-12
//
//  Created by Emre Bakır on 26.12.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var picture: Custom?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = picture?.caption ?? "UNKNOWN PERSON"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = picture?.filename {
            print(imageToLoad)
            let imagePath = getDocumentsDirectory().appendingPathComponent(imageToLoad)
            imageView.image = UIImage(contentsOfFile: imagePath.path)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
