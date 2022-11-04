//
//  FriendTabViewController.swift
//  IN_SOPT_SecondAssignment
//
//  Created by 몽이 누나 on 2022/10/10.
//

import UIKit
import SnapKit

class FriendChatViewController: UIViewController {
    
    private let topView = UIView()
    private let middleView = UIView()
    private let bottomView = UIView()
    
    
    
    private let bottomBtn1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabPersonUnfilled")
        return imageView
    }()
    
    private let bottomBtn2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabChatFilled")
        return imageView
    }()

    private let bottomBtn3 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabSharpUnfilled")
        return imageView
    }()
    
    private let bottomBtn4 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabShopUnfilled")
        return imageView
    }()
    
    private let bottomBtn5 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabMoreUnfilled")
        return imageView
    }()
    
    private let chatLabel: UILabel = {
       let label = UILabel()
        label.text = "채팅"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let openChatLabel: UILabel = {
       let label = UILabel()
        label.text = "오픈채팅"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .systemGray2
        return label
    }()
    
    private let settingButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
    private let plusButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "iconPlus"), for: .normal)
        return button
    }()
    
    private let bannerButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "banner"), for: .normal)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var profileTableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    var profileList: [ProfileModel] = [
        ProfileModel(profileImage: "profileImage1", name: "이재현", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage2", name: "유서린", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage3", name: "이연우", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage4", name: "원종화", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage5", name: "박솝트", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage6", name: "이솝트", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage7", name: "김솝트", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage8", name: "최솝트", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage9", name: "심솝트", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage1", name: "이재현", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage2", name: "유서린", introduce: "살려줘요"),
        ProfileModel(profileImage: "profileImage3", name: "이연우", introduce: "살려줘요")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        config()
        profileLayout()
        register()
        
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

extension FriendChatViewController {
    
    private func layout(){
        view.addSubview(topView)
        [chatLabel, openChatLabel,settingButton, plusButton].forEach {
            topView.addSubview($0)
        }
        
        view.addSubview(middleView)
        [bannerButton].forEach {
            middleView.addSubview($0)
        }
        
        view.addSubview(bottomView)
        
        
        [bottomBtn1, bottomBtn2, bottomBtn3, bottomBtn4, bottomBtn5].forEach {
            bottomView.addSubview($0)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(73)
        }
        
        bannerButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(71.06)
            $0.width.equalTo(343)
        }
        
    
        
        bottomView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(61)
            $0.width.equalToSuperview()
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(14)
            $0.leading.equalTo(self.topView.snp.leading).offset(14)
            
        }
        
        openChatLabel.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(14)
            $0.leading.equalTo(self.chatLabel.snp.trailing).offset(7)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(14)
            $0.trailing.equalTo(self.topView.snp.trailing).inset(14)
            $0.height.equalTo(21)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(14)
            $0.trailing.equalTo(self.topView.snp.trailing).inset(40)
            $0.height.equalTo(21)
        }
        
        bottomBtn1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(75)
        }
        
        bottomBtn2.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.bottomBtn1.snp.trailing)
            $0.height.equalToSuperview()
            $0.width.equalTo(75)
        }
        
        bottomBtn3.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(self.bottomView.snp.centerX)
            $0.height.equalToSuperview()
            $0.width.equalTo(75)
        }
        
        bottomBtn4.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(self.bottomBtn5.snp.leading)
            $0.height.equalToSuperview()
            $0.width.equalTo(75)
        }
        
        bottomBtn5.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(75)
        }
        
    }
    
    private func config(){
        topView.backgroundColor = .white
    }
}

extension FriendChatViewController {
    
    private func profileLayout() {
        view.backgroundColor = .white
        view.addSubview(profileTableView)
        profileTableView.snp.makeConstraints {
            $0.top.equalTo(middleView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.topView).offset(14)
            $0.bottom.equalTo(bottomView.snp.top)
        }
    }
    
    private func register() {
        profileTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
    
}

extension FriendChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
}

extension FriendChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = profileTableView.dequeueReusableCell(
                   withIdentifier: FriendTableViewCell.identifier, for: indexPath)
                       as? FriendTableViewCell else { return UITableViewCell() }
               
               friendCell.dataBind(model: profileList[indexPath.row])
               return friendCell
    }
    
    
}
