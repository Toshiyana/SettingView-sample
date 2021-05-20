//
//  VersionTableViewCell.swift
//  SettingView-sample
//
//  Created by Toshiyana on 2021/04/18.
//

import UIKit

class VersionTableViewCell: UITableViewCell {
    
//    static let identifier = "VersionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //prepareForeReuseにはcontentに関するものをパフォーマンス上，初期化するべきでない．他のところも修正する必要あり．
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        textLabel?.text = nil
//        detailTextLabel?.text = nil
//    }
    
    public func configure(with model: SettingVersionOption) {
        textLabel?.text = model.title//iconImageがなくLabelをCellに付け加えてないので、CellのデフォルトのtextLabelを利用
        detailTextLabel?.text = model.detailText
    }

}
