import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var value: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var trashButton: UIButton!
    @IBOutlet private weak var textField: UITextView!
    private var numberOfTaps = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.isEditable = false
        textField.isScrollEnabled = true
        textField.text = "История изменений:\n"
        updateScreen()
    }
    private func dateStringFunc()->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd-MM-yy HH:mm:ss]"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    private func updateScreen() {
            value.text = "Значение счётчика: \(numberOfTaps)"
            let range = NSMakeRange(textField.text.count - 1, 0)
            textField.scrollRangeToVisible(range)
    }
    @IBAction private func plusButtonPressed(_ sender: Any) {
        numberOfTaps += 1
        textField.text += "\(String(describing: dateStringFunc())): значение изменено на +1\n"
        updateScreen()
    }
    @IBAction private func minusButtonPressed(_ sender: Any) {
        numberOfTaps -= 1
        if numberOfTaps < 0 {
            textField.text += "\(String(describing: dateStringFunc())): попытка уменьшить значение счётчика ниже 0\n"
            numberOfTaps = 0
        } else {
            textField.text += "\(String(describing: dateStringFunc())): значение изменено на -1\n"
        }
        updateScreen()
    }
    @IBAction private func trashButtonPressed(_ sender: Any) {
        numberOfTaps = 0
        textField.text += "\(String(describing: dateStringFunc())): значение счётчика сброшено\n"
        updateScreen()
    }
}
    
