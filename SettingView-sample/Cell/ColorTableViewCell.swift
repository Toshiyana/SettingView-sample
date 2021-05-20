//
//  ColorTableViewCell.swift
//  SettingView-sample
//
//  Created by Toshiyana on 2021/04/17.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    // not including left icon. but include bug.
    
//    static let identifier = "ColorTableViewCell"
    
    private let colorView: UIView = {
        let view = UIView()
        //view.backgroundColor = .blue
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //textLabel?.text = "テーマカラーの変更"
        contentView.addSubview(colorView)
        contentView.clipsToBounds = true//???
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        //colorView.sizeToFit()
        let size: CGFloat = contentView.frame.size.height - 12
//        colorView.frame = CGRect(x: contentView.frame.size.width - colorView.frame.size.width - 50,
//                                 y: contentView.center.y - 16,
//                                 width: size,
//                                 height: size)

        colorView.frame = CGRect(x: contentView.frame.size.width - 45,
                                 y: contentView.center.y - 16,
                                 width: size,
                                 height: size)
        
        colorView.layer.cornerRadius = colorView.frame.size.width / 2
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        textLabel?.text = nil
//        colorView.backgroundColor = nil
//    }

    public func configure(with model: SettingColorOption) {
        textLabel?.text = model.title
        colorView.backgroundColor = model.color
    }

}
