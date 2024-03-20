//
//  ViewController.swift
//  Counter
//
//  Created by Anton Demidenko on 16.3.24..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var textField: UITextView!
    var numberOfTaps = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isEditable = false
        textField.isScrollEnabled = true
        textField.text = "История изменений:\n"
        updateScreen()
        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "[dd-MM-yy HH:mm:ss]"
        let dateString = dateFormatter.string(from: Date())
//plusButton
        if sender.tag == 1 {
            numberOfTaps += 1
            textField.text += "\(dateString): значение изменено на +1\n"
            updateScreen()
        }
//minusButton
        if sender.tag == 2 {
            numberOfTaps -= 1
            if numberOfTaps < 0 {
                textField.text += "\(dateString): попытка уменьшить значение счётчика ниже 0\n"
                numberOfTaps = 0
            } else {
                textField.text += "\(dateString): значение изменено на -1\n"
            }
            updateScreen()
        }
//trashButton
        if sender.tag == 3 {
            numberOfTaps = 0
            textField.text += "\(dateString): значение счётчика сброшено\n"
            updateScreen()
            }
        }
        func updateScreen() {
            value.text = "Значение счётчика: \(numberOfTaps)"
            let range = NSMakeRange(textField.text.count - 1, 0)
            textField.scrollRangeToVisible(range)
        }
    }
