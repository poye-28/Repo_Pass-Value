//
//  SecondViewController.swift
//  PassValue
//
//  Created by POYEH on 2020/1/16.
//  Copyright © 2020 POYEH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var updateHandler: ((String) -> Void)?
    
    let fullScreen = UIScreen.main.bounds.width
    
    var labelText = ""
    
    var textUpdated = ""
    
    var textField : UITextField = {
        
        let tF = UITextField()
        
        tF.placeholder = "請輸入數字"
        
        tF.borderStyle = .roundedRect
        
        tF.translatesAutoresizingMaskIntoConstraints = false
        
        return tF
        
    }()
    
    let button : UIButton = {
        
        let btn = UIButton()
        
        btn.backgroundColor = .black

        btn.setTitle("Button", for: .normal)
        
        btn.setTitleColor(.white, for: .normal)
        
        return btn
        
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTextField()
        
        setupButton()
        
    }
    
    func setupTextField() {
        
        self.view.addSubview(textField)
        
        textField.delegate = self
        
        if labelText != "" {
            textField.text = labelText
        }
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: fullScreen * 2 / 3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
    }
    
    func setupButton() {
        
        button.addTarget(self, action: #selector(upadateValue), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: fullScreen * 2 / 3),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20)
        ])
        
    }
    
    @objc func upadateValue() {
        
        self.navigationController?.popViewController(animated: true)
                
    }

}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        textUpdated = text
        
        updateHandler?(textUpdated)
        
    }
    
}




