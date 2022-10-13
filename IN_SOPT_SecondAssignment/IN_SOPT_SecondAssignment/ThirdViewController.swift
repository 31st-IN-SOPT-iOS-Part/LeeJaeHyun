//
//  thirdViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/06.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {

    private let welcomeLabel: UILabel = {
       let label = UILabel()
        
        label.text = "000님"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let secondWelcomeLabel: UILabel = {
       let label = UILabel()
        
        label.text = "환영합니다"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let checkButton: UIButton = {
       let button = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemYellow
        
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkButton.addTarget(self, action: #selector(touchupCheckButton), for: .touchUpInside)
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        layout()
        
        
    }
    
    func dataBind() {
        guard let result = self.result else {return}
        welcomeLabel.text = "\(result) 님"
    }
    
    @objc
    private func touchupCheckButton() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension ThirdViewController {
    
    private func layout() {
        [welcomeLabel, secondWelcomeLabel, checkButton].forEach {
            view.addSubview($0)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(300)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        secondWelcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(5)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(self.secondWelcomeLabel.snp.bottom).offset(75)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(17)
            $0.height.equalTo(50)
        }
        
    }
    
}
