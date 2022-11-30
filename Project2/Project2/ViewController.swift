//
//  ViewController.swift
//  Project2
//
//  Created by Emre Bakır on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var q = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        /*
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        */
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())."
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        q += 1
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else{
            title = "Wrong, You should have chosen \(countries[correctAnswer].uppercased()), not \(countries[sender.tag].uppercased()) "
            score -= 1
        }
        
        //alert
        if q != 10{
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            //continue and do...
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            //start
            present(ac, animated: true)
        } else {
            q = 0
            let ac = UIAlertController(title: "Done", message: "Your last score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start again?", style: .default, handler: askQuestion(action:)))
            present(ac,animated: true)
            score = 0
        }
        
    }
    
    @objc func showScore() {
        let message = "Your score is \(score)"
        let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.backBarButtonItem
        present(vc, animated: true)
    }

}

