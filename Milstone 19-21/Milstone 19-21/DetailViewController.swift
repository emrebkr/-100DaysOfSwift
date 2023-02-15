//
//  DetailViewController.swift
//  Milstone 19-21
//
//  Created by Emre Bakır on 3.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet var script: UITextView!
    
    var indexOfNote: Int?
    var detailNote: Note?
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
                
        script.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        if let titleNote = detailNote {
            script.text = titleNote.title
        }
        
        // Set up notifications when keyboard changing frame every state of its size (show, hide, orientation, QuickType...)
        // and when hide keyboard animation is finished
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let background = UIImage(named: "background")
        view.backgroundColor = UIColor(patternImage: background!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @objc func adjustForKeyboard(notification: Notification) {
        // UIResponder.keyboardFrameEndUserInfoKey is the frame of the keyboard when its animation has finished
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        // We take the size of the last frame of the kayboard (CGRect containing CGPoint and CGSize)
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        
        // We need to convert the CGRect of the keyboard to our view's coordinate (Fix if the user rotate the device)
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, to: view.window)
        
        // If the keyboard has finished hiding the content inset of textView will be 0
        if notification.name == UIResponder.keyboardWillHideNotification {
            script.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            // Fix the scrolling indicator to not go below the keyboard
            script.scrollIndicatorInsets = .zero
            
            // Hide done button when hiding keyboard
            navigationItem.setRightBarButton(nil, animated: true)
        } else {
            // If the keyboard is not hiding (it's visible) the bottom of the content inset will be the height of the keyboard
            script.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom + 5.00, right: 20)
            // Fix the scrolling indicator to not go below the keyboard
            script.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
            
            // Show Done button when showing keyboard
            navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done)), animated: true)
        }
        
        // selectedRange is where is the cursor
        let selectedRange = script.selectedRange
        // Scroll the view to the cursor
        script.scrollRangeToVisible(selectedRange)
    }
    

    @objc func done() {
        let rightNow = Date()
        let customDate = DateFormatter.localizedString(from: rightNow, dateStyle: .short, timeStyle: .none)

        // Add the note to the array of notes and then save
        if detailNote != nil {
            detailNote?.title = script.text
            detailNote?.date = customDate
            notes[indexOfNote!] = detailNote!
            save()
        } else if script.text.count > 1 {
            let newNote = Note(title: script.text, date: customDate)
            notes.append(newNote)
            save()
        }
        
        // Go back to the first view controller in the navigation stack
        navigationController?.popViewController(animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()

        if let savedNotes = try? jsonEncoder.encode(notes) {
            defaults.set(savedNotes, forKey: "notes")
        } else {
            print("Failed to save notes.")
        }
    }
    
}
