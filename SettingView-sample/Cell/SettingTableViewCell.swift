//
//  SettingTableViewCell.swift
//  SettingView-sample
//
//  Created by Toshiyana on 2021/04/11.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        //view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 画像iconが左端に配置されている場合、Autolayoutを気にしなくて良い
        // 画面サイズは右に広がるから
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        //iconContainer.layer.cornerRadius = iconContainer.frame.size.width / 2//frameを定義した後でないと，円形にできない
        
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        iconContainer.backgroundColor = nil
//        iconImageView.image = nil
//        label.text = nil
//    }
    
    public func configure(with model: SettingOption) {
        iconContainer.backgroundColor = model.iconBackgroundColor
        iconImageView.image = model.icon
        label.text = model.title
    }
}
