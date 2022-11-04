//
//  SelectPhotoCollectionViewCell.swift
//  IN_SOPT_FirstAssignment
//
//  Created by 몽이 누나 on 2022/11/03.
//

import UIKit
import SnapKit
import Then

final class SelectPhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "SelectPhotoCollectionViewCell"
    
    private let photoContainerView = UIView()
    private let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectPhotoCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [photoContainerView, photoImageView].forEach {
            contentView.addSubview($0)
        }
        
        photoContainerView.addSubview(photoImageView)
        photoContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(123)
        }
        
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    public func dataBind(model: PhotoModel) {
        photoImageView.image = UIImage(named: model.Image)
    }
}
