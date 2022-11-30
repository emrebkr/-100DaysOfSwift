//
//  ViewController.swift
//  Project5
//
//  Created by Emre Bakır on 26.11.2022.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
        
    }

    
    @objc func startGame(){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return usedWords.count
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased() // Dense - dense : cense - X
        
        
        if (lowerAnswer.count < 3) {
            showErrorMessage(error: "short")
        }
        else if (lowerAnswer == title){
            showErrorMessage(error: "same")
        }
        else {
            if isPossible(word: lowerAnswer){
                if isOriginal(word: lowerAnswer){
                    if isReal(word: lowerAnswer){
                        usedWords.insert(answer.lowercased(), at: 0)
                        
                        let indexPath = IndexPath(row: 0, section: 0)
                        tableView.insertRows(at: [indexPath], with: .automatic)
                        
                        return
                    } else {
                        showErrorMessage(error: "notreal")
                        
                        
                    }
                } else {
                    showErrorMessage(error: "notoriginal")
                    
                }
            } else {
                showErrorMessage(error: "notpossible")
            }
        }
    }
    
    func showErrorMessage(error: String) {
        
        let errorTitle: String
        let errorMessage: String
        
        switch error {
        case "short":
            errorTitle = "Short word"
            errorMessage = "You should write a little longer word"
        case "same":
            errorTitle = "Not that word!"
            errorMessage = "You cannot set the word to main word"
        case "notreal":
            errorTitle = "Word not recognized"
            errorMessage = "You can't just make them up, you know!"
        case "notoriginal":
            errorTitle = "Word already used"
            errorMessage = "Be more original!"
        case "notpossible":
            guard let title = title else { return }
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title.lowercased())"
        default:
            return
        }
        
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool { // Dense - dense : cense - X
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    

}

