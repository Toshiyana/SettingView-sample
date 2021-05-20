//
//  VersionTableViewController.swift
//  SettingView-sample
//
//  Created by Toshiyana on 2021/04/18.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOptionType]
}

enum SettingOptionType {
    case normalCell(model: NormalOption)
    case staticCell(model: SettingOption)
    case switchCell(model: SettingSwitchOption)
    case versionCell(model: SettingVersionOption)
    case iconVersionCell(model: SettingIconVersionOption)
    case colorCell(model: SettingColorOption)
    case iconColorCell(model: SettingIconColorOption)
}

struct NormalOption {
    let title: String
    let handler: (() -> Void)
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
    let handler: (() -> Void)
}

struct SettingSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingVersionOption {
    let title: String
    let detailText: String
}

struct SettingIconVersionOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
    let detailText: String
}

struct SettingColorOption {
    let title: String
    let color: UIColor
    let handler: (() -> Void)
}

struct SettingIconColorOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor?
    let color: UIColor
    let handler: (() -> Void)
}

class ColorVersionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: K.normalCellIdentifier)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: K.settingCellIdentifier)//自作のSettingTableViewCellを利用
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: K.switchCellIdentifier)
        table.register(VersionTableViewCell.self, forCellReuseIdentifier: K.versionCellIdentifier)
        table.register(IconVersionTableViewCell.self, forCellReuseIdentifier: K.iconVersionCelldentifier)
        table.register(ColorTableViewCell.self, forCellReuseIdentifier: K.colorCellIdentifier)
        table.register(IconColorTableViewCell.self, forCellReuseIdentifier: K.iconColorCellIdentifier)
        return table
    }()
    
    var models = [Section]()
    private let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        title = "Setting"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        print(version)
    }

    func configure() {
        models.append(Section(title: "General", options: [
            .normalCell(model: NormalOption(title: "NormalCell", handler: {})),
            .switchCell(model: SettingSwitchOption(title: "Wifi", icon: UIImage(systemName: "paperclip"), iconBackgroundColor: nil, isOn: false) {
                print("Tapped Switching cell")
            }),
            .versionCell(model: SettingVersionOption(title: "Version", detailText: version)),
            .iconVersionCell(model: SettingIconVersionOption(
                                title: "IconVersion",
                                icon: UIImage(systemName: "paperclip"),
                                iconBackgroundColor:
                                    nil,
                                detailText: version)),
            .colorCell(model: SettingColorOption(title: "ColorTableViewCell", color: .blue) {
                //
            }),
            .iconColorCell(model: SettingIconColorOption(title: "Change Theme Color", icon: UIImage(systemName: "paintpalette"), iconBackgroundColor: nil, color: .red) {
                //
            })
        ]))

        models.append(Section(title: "General", options: [
            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                if let url = URL(string: "https://www.hackingwithswift.com") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }),
            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            }),
            
            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            }),
            
            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            })
        ]))

        models.append(Section(title: "Apps", options: [
            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                
            }),
            
            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                
            })
        ]))

    }
    
    //MARK: - TableView Methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        //switch-case-letという構文
        // case .列挙子(let 付属値)とすることで, 付属値をブロック内で扱える
        case .normalCell(let model):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: K.normalCellIdentifier,
                for: indexPath)
            cell.textLabel?.text = model.title
            cell.accessoryType = .disclosureIndicator
            return cell
        
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.settingCellIdentifier,
                    for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.switchCellIdentifier,
                    for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .versionCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.versionCellIdentifier,
                    for: indexPath
            ) as? VersionTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .iconVersionCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.iconVersionCelldentifier,
                    for: indexPath
            ) as? IconVersionTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .colorCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.colorCellIdentifier,
                    for: indexPath
            ) as? ColorTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        
        case .iconColorCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: K.iconColorCellIdentifier,
                    for: indexPath
            ) as? IconColorTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // action when cell was tapped
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .normalCell(let model):
            model.handler()
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .colorCell(let model):
            model.handler()
        case .iconColorCell(let model):
            model.handler()
        default://case .versionCell, case .iconVersionCell
            return 
            //print("Don't any thing.")
        }
    }
  
}
