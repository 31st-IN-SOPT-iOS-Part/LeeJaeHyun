//
//  FriendTableViewCell.swift
//  IN_SOPT_FirstAssignment
//
//  Created by 몽이 누나 on 2022/11/03.
//

import UIKit

import SnapKit
import Then

final class FriendTableViewCell: UITableViewCell {

    static let identifier = "FriendTableViewCell"
    
    private let friendContainerView = UIView()
    private let friendImageView = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let introduceLabel = UILabel().then {
        $0.textColor = .systemGray2
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layout()
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

}

extension FriendTableViewCell {
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [friendContainerView, friendImageView, nameLabel, introduceLabel].forEach {
            contentView.addSubview($0)
        }
        
        friendContainerView.addSubview(friendImageView)
        friendContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(3.43)
            $0.width.height.equalTo(50)
        }
        
        friendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(54.13)
            $0.height.equalTo(42.05)

        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(friendContainerView.snp.trailing).offset(8.73)
        }
        
        introduceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameLabel)
        }
    }
    
    func dataBind(model: ProfileModel) {
        nameLabel.text = model.name
        introduceLabel.text = model.introduce
        friendImageView.image = UIImage(named: model.profileImage)
    }
    
}
