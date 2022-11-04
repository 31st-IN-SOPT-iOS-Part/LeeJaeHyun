//
//  SelectPhotoViewController.swift
//  IN_SOPT_FirstAssignment
//
//  Created by 몽이 누나 on 2022/11/03.
//

import UIKit
import SnapKit
import Then

final class SelectPhotoViewController: UIViewController {
    
    private let topView = UIView()
    private let middleView = UIView()
    private let bottomView = UIView()
    
    private let bottomBtn1 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabPersonFilled")
        return imageView
    }()
    
    private let recentLabel: UILabel = {
       let label = UILabel()
        label.text = "최근 항목"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private let sendLabel: UILabel = {
       let label = UILabel()
        label.text = "전송"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()

    private let xBtn : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "x")
        return imageView
    }()
    
    private let bottomBtn2 : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconTabChatUnfilled")
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

    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    var photoList: [PhotoModel] = [
        PhotoModel(Image: "galleryImage0"),
        PhotoModel(Image: "galleryImage1"),
        PhotoModel(Image: "galleryImage2"),
        PhotoModel(Image: "galleryImage3"),
        PhotoModel(Image: "galleryImage4"),
        PhotoModel(Image: "galleryImage5"),
        PhotoModel(Image: "galleryImage6"),
        PhotoModel(Image: "galleryImage7"),
        PhotoModel(Image: "galleryImage8"),
        PhotoModel(Image: "galleryImage9"),
        PhotoModel(Image: "galleryImage10"),
        PhotoModel(Image: "galleryImage11"),
        PhotoModel(Image: "galleryImage12"),
        PhotoModel(Image: "galleryImage13"),
        PhotoModel(Image: "galleryImage14"),
        PhotoModel(Image: "galleryImage15"),
        PhotoModel(Image: "galleryImage16"),
        PhotoModel(Image: "galleryImage17"),
        PhotoModel(Image: "galleryImage18"),
        PhotoModel(Image: "galleryImage19"),
        PhotoModel(Image: "galleryImage20"),
        PhotoModel(Image: "galleryImage21"),
        PhotoModel(Image: "galleryImage22"),
        PhotoModel(Image: "galleryImage23"),
    ]
    
    final let cellHeight: CGFloat = 123
    final let lineSpacing: CGFloat = 7
    final let interItemSpacing: CGFloat = 9
    final let inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        register()
        // Do any additional setup after loading the view.
    }
    

}

extension SelectPhotoViewController {
    
    private func layout() {
        view.addSubview(topView)
        view.addSubview(middleView)
        view.addSubview(bottomView)
        
        
        [recentLabel, sendLabel, xBtn].forEach {
            topView.addSubview($0)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(38)
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.bottom)
            $0.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.bottomView.snp.top)
        }
        
        middleView.addSubview(photoCollectionView)
        
        [bottomBtn1, bottomBtn2, bottomBtn3, bottomBtn4, bottomBtn5].forEach {
            bottomView.addSubview($0)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(61)
            $0.width.equalToSuperview()
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
    
        view.backgroundColor = .white
        photoCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.topView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    

        recentLabel.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(11)
            $0.centerX.equalToSuperview()
        }
        
        sendLabel.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(11)
            $0.trailing.equalTo(self.topView.snp.trailing).inset(10)
        }
        
        xBtn.snp.makeConstraints {
            $0.top.equalTo(self.topView.snp.top).offset(11)
            $0.leading.equalTo(self.topView.snp.leading).offset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
    
        
        
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        
        return heightCount * cellHeight + (heightCount - 1) * lineSpacing + inset.top + inset.bottom
    }
    
    private func register() {
        photoCollectionView.register(SelectPhotoCollectionViewCell.self, forCellWithReuseIdentifier: SelectPhotoCollectionViewCell.identifier)
    }
    
}

extension SelectPhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(
                   withReuseIdentifier: SelectPhotoCollectionViewCell.identifier, for: indexPath)
                       as? SelectPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }
}

extension SelectPhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let tripleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing * 2
        
        return CGSize(width: tripleCellWidth / 3, height: 123)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return lineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return interItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return inset
    }
}
