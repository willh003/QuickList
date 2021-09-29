//
//  ViewController.swift
//  QuickList
//
//  Created by Will H on 9/28/21.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel = UILabel()
    var mainImageView = UIImageView()
    var addItemButton = UIButton()
    var inputTextView = UITextView()
    var inputSetupField = UITextField()
    var inputPunchField = UITextField()
    var inputText: String = ""
    var jokeNumber: Int = 1
    let mainColor = UIColor(red: 0, green: 0.1412, blue: 0.3686, alpha: 1.0)
    let secondaryColor = CGColor(gray: 0.2, alpha: 0.6)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        mainImageView.image = UIImage(named: "todolist1-removebg-preview")
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        mainImageView.layer.cornerRadius = 5
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImageView)
        
        titleLabel.text = "Never Forget a Joke!"
        titleLabel.textColor = mainColor
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)


        addItemButton.setTitle("Add that", for: .normal)
        addItemButton.setTitleColor(.white, for: .normal)
        addItemButton.backgroundColor = mainColor
        addItemButton.layer.borderWidth = 1
        addItemButton.layer.borderColor = mainColor.cgColor
        addItemButton.layer.cornerRadius = 10
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
        view.addSubview(addItemButton)

        inputSetupField.placeholder = "Set up (what do you call a fake noodle?)"
        inputSetupField.textColor = .darkGray
        inputSetupField.font = .systemFont(ofSize: 15)
        inputSetupField.textAlignment = .center
        inputSetupField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputSetupField)
        
        inputPunchField.placeholder = "Punch Line (impasta lmaooooo)"
        inputPunchField.textColor = .darkGray
        inputPunchField.textAlignment = .center
        inputPunchField.font = .systemFont(ofSize: 15)
        inputPunchField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputPunchField)

        
        inputTextView.text = inputText
        inputTextView.isEditable = false
        inputTextView.font = .systemFont(ofSize: 18)
        inputTextView.textAlignment = .left
        inputTextView.textColor = .darkGray
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputTextView)

        setupConstraints()
    }


    @objc func addItemButtonTapped() {
        guard let setup = inputSetupField.text else { return }
        guard let punch = inputPunchField.text else { return }
        if (setup == "") {
            let alertView = UIAlertController(title: "No Setup", message: "The setup just wasn't there", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "I'll Fix It", style: .cancel, handler: nil))
            self.present(alertView, animated: true)
            return
        }
        if (punch == "") {
            let alertView = UIAlertController(title: "No Punch Line", message: "What's a joke without the punch?", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "I'll Fix It", style: .cancel, handler: nil))
            self.present(alertView, animated: true)
            return
        }
        
        inputText += String(jokeNumber) + ". " + setup + "\n\t" + punch + "\n\n"
        inputTextView.text = inputText
        inputSetupField.text = ""
        inputPunchField.text = ""
        jokeNumber+=1
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainImageView.heightAnchor.constraint(equalToConstant: 200),
            mainImageView.widthAnchor.constraint(equalToConstant: 200),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            inputSetupField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            inputSetupField.heightAnchor.constraint(equalToConstant: 23),
            inputSetupField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputSetupField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            inputPunchField.topAnchor.constraint(equalTo: inputSetupField.bottomAnchor, constant: 14),
            inputPunchField.heightAnchor.constraint(equalToConstant: 23),
            inputPunchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputPunchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.topAnchor.constraint(equalTo: inputPunchField.bottomAnchor, constant: 30),
            addItemButton.widthAnchor.constraint(equalToConstant: 120),
            addItemButton.heightAnchor.constraint(equalToConstant: 50),
            addItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            inputTextView.topAnchor.constraint(equalTo: addItemButton.bottomAnchor, constant: 10),
            inputTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            inputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }


}

