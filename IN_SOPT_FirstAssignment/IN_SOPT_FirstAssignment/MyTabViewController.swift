//
//  MyTabViewController.swift
//  IN_SOPT_SecondAssignment
//
//  Created by 몽이 누나 on 2022/10/10.
//

import UIKit
import SnapKit

class MyTabViewController: UIViewController {
    
    private let lineView = UIView()
    
    private let profileCloseBtn: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchUpCloseBtn), for: .touchUpInside)
        return button
    }()
    
    private let profileImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private let profileEditImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileEditImg")
        return imageView
    }()
    
    private let profileStoryImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileStoryImg")
        return imageView
    }()
    
    private let profileTalkImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileTalkImg")
        return imageView
    }()
        
    private lazy var firstBtnView : UIView = {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUPFirstBtn))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var secondBtnView : UIView = {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUPSecondBtn))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var thirdBtnView : UIView = {
        let view = UIView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUPthirdBtn))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let profileEditLabel: UILabel = {
       let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    private let profileStoryLabel: UILabel = {
       let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    private let profileTalkLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 135/255, green: 145/255, blue: 152/255, alpha: 1)
        
        layout()
        config()
        
    }
    
    @objc
    private func touchUpCloseBtn(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func touchUPFirstBtn(){}
    
    @objc
    private func touchUPSecondBtn(){}
    
    @objc
    private func touchUPthirdBtn(){}
    
}

extension MyTabViewController {
    
    private func layout() {
        
        [profileCloseBtn, profileImg, nameLabel, lineView, firstBtnView, secondBtnView, thirdBtnView].forEach {
            view.addSubview($0)
        }
        
        [profileTalkImg, profileTalkLabel].forEach {
            firstBtnView.addSubview($0)
        }
        
        [profileEditImg, profileEditLabel].forEach {
            secondBtnView.addSubview($0)
        }
        
        [profileStoryImg, profileStoryLabel].forEach {
            thirdBtnView.addSubview($0)
        }
        
        // 닫기 버튼
        
        profileCloseBtn.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
        }
        
        // 구분선
        
        lineView.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(137)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        // 프로필 부분
        
        profileImg.snp.makeConstraints {
            $0.bottom.equalTo(self.lineView.snp.top).offset(-71)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImg.snp.bottom).offset(8)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        
        
        // 아래 버튼 부분
        
        firstBtnView.snp.makeConstraints {
            $0.top.equalTo(self.lineView.snp.bottom).offset(12)
            $0.trailing.equalTo(self.view.snp.centerX).offset(-48)
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        secondBtnView.snp.makeConstraints {
            $0.top.equalTo(self.firstBtnView.snp.top)
            $0.leading.equalTo(self.firstBtnView.snp.trailing)
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        thirdBtnView.snp.makeConstraints {
            $0.top.equalTo(self.firstBtnView.snp.top)
            $0.leading.equalTo(self.view.snp.centerX).offset(48)
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        // 나와의 채팅
        
        profileTalkLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.firstBtnView.snp.bottom).offset(-14)
            $0.centerX.equalTo(self.firstBtnView.snp.centerX)
        }
        
        profileTalkImg.snp.makeConstraints {
            $0.bottom.equalTo(self.profileTalkLabel.snp.top).offset(-9)
            $0.centerX.equalTo(self.firstBtnView.snp.centerX)
            $0.width.equalTo(18.86)
        }
        
        // 프로필 편집
        
        profileEditLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.secondBtnView.snp.bottom).offset(-14)
            $0.centerX.equalTo(self.secondBtnView.snp.centerX)
        }
        
        profileEditImg.snp.makeConstraints {
            $0.bottom.equalTo(self.profileEditLabel.snp.top).offset(-9)
            $0.centerX.equalTo(self.secondBtnView.snp.centerX)
            $0.width.equalTo(17.72)
        }
        
        // 카카오스토리
        
        profileStoryLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.thirdBtnView.snp.bottom).offset(-14)
            $0.centerX.equalTo(self.thirdBtnView.snp.centerX)
        }
        
        profileStoryImg.snp.makeConstraints {
            $0.bottom.equalTo(self.profileStoryLabel.snp.top).offset(-9)
            $0.centerX.equalTo(self.thirdBtnView.snp.centerX)
            $0.width.equalTo(18.55)
        }
        
    }
    
    private func config(){
        lineView.backgroundColor = .white
        //firstBtnView.backgroundColor = .blue
        //secondBtnView.backgroundColor = .red
        //thirdBtnView.backgroundColor = .black
    }
}
