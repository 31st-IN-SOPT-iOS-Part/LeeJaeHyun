//
//  ViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
        
    private let startLabel: UILabel = {
       let label = UILabel()
        
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private let startSubLabel: UILabel = {
       let label = UILabel()
        
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해주세요."
        
        label.numberOfLines = 2 // 줄바꿈을 위해 (default 값이 1임)
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "이메일 또는 전화번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing // clear button 추가
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
        textField.isSecureTextEntry = true // 입력하는 문자 가리기
        textField.clearButtonMode = .whileEditing // clear button 추가
        
        return textField
    }()
    
    let secondUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        
        // 버튼 둥글게 만들기 어떻게 하나요?
        button.layer.cornerRadius = 5
        
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray6
        
        button.addTarget(self, action: #selector(touchupLoginButoon), for: .touchUpInside)
        
        return button
    }()
    
    private let newAccountSetButton: UIButton = {
       let button = UIButton()
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray6
        
        button.addTarget(self, action: #selector(touchupNewAccountSetButton), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    private let findmyAccount: UIButton = {
        let button = UIButton()
        
        button.setTitle("카카오 계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        layout()
        
    }
    
    private func presentTothirdVC() {
        let thirdVC = ThirdViewController()
        
        thirdVC.modalPresentationStyle = .formSheet
        
        thirdVC.result = idTextField.text
        thirdVC.dataBind()
        
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    private func pushTosecondVC() {
        let secondVC = SecondViewController()
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupLoginButoon() {
        presentTothirdVC()
    }
    
    @objc
    private func touchupNewAccountSetButton() {
        pushTosecondVC()
    }
}

extension ViewController {
    private func layout(){
        
        [startLabel, startSubLabel, idTextField, underLineView, pwTextField, secondUnderLineView, loginButton, newAccountSetButton, findmyAccount].forEach {
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(130)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        startSubLabel.snp.makeConstraints {
            $0.top.equalTo(self.startLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.startSubLabel.snp.bottom).offset(50)
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(self.secondUnderLineView.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(50)
        }
        
        newAccountSetButton.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(50)
        }
        
        findmyAccount.snp.makeConstraints {
            $0.top.equalTo(self.newAccountSetButton.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(30)
        }
    }
}
