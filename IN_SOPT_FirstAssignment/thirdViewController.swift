//
//  thirdViewController.swift
//  IN_SOPT_firstHomework
//
//  Created by 몽이 누나 on 2022/10/06.
//

import UIKit

class thirdViewController: UIViewController {

    private let welcomeLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 300, width: 393, height: 30))
        
        label.text = "000님"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let secondWelcomeLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 335, width: 393, height: 30))
        
        label.text = "환영합니다"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    private let checkButton: UIButton = {
       let button = UIButton(frame: CGRect(x: 20, y: 440, width: 355, height: 50))
        
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
        
        let components: [Any] = [welcomeLabel, secondWelcomeLabel,checkButton]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
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
