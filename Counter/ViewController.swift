//
//  ViewController.swift
//  Counter
//
//  Created by Anton Demidenko on 16.3.24..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var countButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var numberOfTaps = 0
    @IBAction func buttonDidTap(_ sender: Any) {
        numberOfTaps += 1
        var text = "Значение счётчика: \(numberOfTaps)"
        if text.count > 18 {
                // Разделение текста на строки
                let startIndex = text.index(text.startIndex, offsetBy: 18)
                let secondLine = text[startIndex...]
                text = "\(text.prefix(18))\n\(secondLine)"
                
                // Установка размера шрифта 72 для оставшейся части текста
                let range = NSRange(location: 18, length: text.count - 18)
                let attributedString = NSMutableAttributedString(string: text)
                attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 72), range: range)
                
                // Устанавливаем атрибутированную строку в UILabel
                value.attributedText = attributedString
            } else {
                // Если длина текста не превышает 18 символов, устанавливаем его без изменений
                value.text = text
            }
        }
        }
    

