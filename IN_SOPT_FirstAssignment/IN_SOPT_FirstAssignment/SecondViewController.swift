//
//  SecondViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/06.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    private let startLabel: UILabel = {
       let label = UILabel()
        
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "이메일 또는 전화번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none // 소문자 입력
        
        return textField
    }()
    
    let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        
        return view
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "비밀번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    let secondUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let pwCheckTextField: UITextField = {
       let textField = UITextField()
        
        textField.text = "비밀번호 확인"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    let thirdUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let newAccountSetButton: UIButton = {
       let button = UIButton()
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray6
        
        button.layer.cornerRadius = 5

        button.addTarget(self, action: #selector(touchupNewAccountSetButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        layout()
        
        
    }
    
    private func presentTothirdVC() {
        
        let thirdVC = ThirdViewController()
        
        thirdVC.modalPresentationStyle = .formSheet
        
        thirdVC.result = idTextField.text
        thirdVC.dataBind()

        self.present(thirdVC, animated: true, completion: nil)
    }
    
    
    @objc
    private func touchupNewAccountSetButton() {
        presentTothirdVC()
    }
    
}

extension SecondViewController {
    
    private func layout() {
        
        [startLabel, idTextField, underLineView, pwTextField, secondUnderLineView, pwCheckTextField, thirdUnderLineView, newAccountSetButton].forEach {
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(130)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.startLabel.snp.bottom).offset(110)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(1)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(self.underLineView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
        }
        
        secondUnderLineView.snp.makeConstraints {
            $0.top.equalTo(self.pwTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(1)
        }
        
        pwCheckTextField.snp.makeConstraints {
            $0.top.equalTo(self.secondUnderLineView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
        }
        
        thirdUnderLineView.snp.makeConstraints {
            $0.top.equalTo(self.pwCheckTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(1)
        }
        
        newAccountSetButton.snp.makeConstraints {
            $0.top.equalTo(self.thirdUnderLineView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(50)
        }
    }
    
    
}
