//
//  SecondViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let startLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 130, width: 393, height: 30))
        
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 270, width: 360, height: 30))
        
        textField.placeholder = "이메일 또는 전화번호"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
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
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    let secondUnderLineView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 360, width: 355, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let pwCheckTextField: UITextField = {
       let textField = UITextField(frame: CGRect(x: 20, y: 370, width: 360, height: 30))
        
        textField.text = "비밀번호 확인"
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    let thirdUnderLineView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 410, width: 355, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let newAccountSetButton: UIButton = {
       let button = UIButton(frame: CGRect(x: 20, y: 440, width: 355, height: 50))
        
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
        
        let components: [Any] = [startLabel, idTextField, underLineView, pwTextField, secondUnderLineView, pwCheckTextField, thirdUnderLineView, newAccountSetButton]
        
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
    
    
    @objc
    private func touchupNewAccountSetButton() {
        presentTothirdVC()
    }
    


}
