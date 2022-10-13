//
//  FriendTabViewController.swift
//  IN_SOPT_SecondAssignment
//
//  Created by 몽이 누나 on 2022/10/10.
//

import UIKit
import SnapKit

class FriendTabViewController: UIViewController {
    
    private let topView = UIView()
    
    private let friendLabel: UILabel = {
       let label = UILabel()
        label.text = "친구"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let profileButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.addTarget(self, action: #selector(touchUpProfile), for: .touchUpInside)
        return button
    }()
    
    private let settingButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        config()
        
        // Do any additional setup after loading the view.
    }
    
    private func presentToMyTabViewVC() {
        let MyTabViewVC = MyTabViewController()
        MyTabViewVC.modalPresentationStyle = .formSheet
        self.present(MyTabViewVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchUpProfile() {
        presentToMyTabViewVC()
    }
}

extension FriendTabViewController {
    
    private func layout(){
        view.addSubview(topView)
        [friendLabel, settingButton].forEach {
            topView.addSubview($0)
        }
        view.addSubview(profileButton)
        
        topView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(14)
            $0.leading.equalTo(self.topView.snp.leading).offset(14)
            $0.width.equalTo(41)
        }
        
        settingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.friendLabel.snp.bottom)
            $0.leading.equalTo(self.friendLabel.snp.trailing).offset(6)
            $0.height.equalTo(21)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom).offset(15)
            $0.leading.equalTo(self.friendLabel.snp.leading)
            $0.width.equalTo(59)
        }
    }
    
    private func config(){
        topView.backgroundColor = .white
    }
}
