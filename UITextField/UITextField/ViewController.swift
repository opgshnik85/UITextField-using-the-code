//
//  ViewController.swift
//  UITextField
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        /* Поднимаем наш UITextField (бывают случаи, что клавиатура закрывает наш ввод текста,
        для этого мы поднимаем его автоматически*/
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil
                ,queue: nil) { (nc) in
            self.view.frame.origin.y = -200
                }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil
                ,queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
                }
        
        self.myTextField.delegate = self
        
        //Устанавливаем размер нашему UITextField
        let textFieldFrame = CGRect(x: 0, y: 0, width: 350, height: 50)
        
        self.myTextField = UITextField(frame: textFieldFrame)
        //Стиль границы для текстового поля
        self.myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        //Вертикальное выравнивание содержимого в границах элемента управления
        self.myTextField.contentVerticalAlignment = .center
        //Выравнивание текста
        self.myTextField.textAlignment = .center
        //Строка, которая отображается, когда в текстовом поле нет другого текста
        self.myTextField.placeholder = "Введите текст"
        //Выравниваем по центру
        self.myTextField.center = self.view.center
        //Добавляем UITextField на View
        view.addSubview(self.myTextField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.myTextField.resignFirstResponder()
        return true
    }
}
