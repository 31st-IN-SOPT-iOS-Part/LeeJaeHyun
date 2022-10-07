//
//  ViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {
        
    private let startLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 130, width: 393, height: 30))
        
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private let startSubLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 160, width: 393, height: 60))
        
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해주세요."
        
        label.numberOfLines = 2 // 줄바꿈을 위해 (default 값이 1임)
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 270, width: 360, height: 30))
        
        textField.placeholder = "이메일 또는 전화번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing // clear button 추가
        textField.autocapitalizationType = .none // 소문자 입력
        
        return textField
    }()
    
    let underLineView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 310, width: 355, height: 1))
        view.backgroundColor = .systemGray4
        
        return view
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 320, width: 360, height: 30))
        
        textField.placeholder = "비밀번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.isSecureTextEntry = true // 입력하는 문자 가리기
        textField.clearButtonMode = .whileEditing // clear button 추가
        
        return textField
    }()
    
    let secondUnderLineView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 360, width: 355, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton(frame: CGRect(x: 20, y: 400, width: 355, height: 50))
        
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
       let button = UIButton(frame: CGRect(x: 20, y: 460, width: 355, height: 50))
        
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray6
        
        button.addTarget(self, action: #selector(touchupNewAccountSetButton), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    private let findmyAccount: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 525, width: 393, height: 30))
        
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
        
        let components: [Any] = [startLabel, startSubLabel, idTextField, pwTextField, loginButton, newAccountSetButton, findmyAccount, underLineView, secondUnderLineView]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
    }
    
    private func presentTothirdVC() {
        let thirdVC = thirdViewController()
        
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

