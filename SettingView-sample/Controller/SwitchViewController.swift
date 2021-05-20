////
////  ViewController.swift
////  SettingView-sample
////
////  Created by Toshiyana on 2021/04/11.
////
//
//import UIKit
//
//struct Section {
//    let title: String
//    let options: [SettingOptionType]
//}
//
//enum SettingOptionType {
//    case staticCell(model: SettingOption)
//    case switchCell(model: SettingSwitchOption)
//}
//
//struct SettingOption {
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    let handler: (() -> Void)
//}
//
//struct SettingSwitchOption {
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    var isOn: Bool
//    let handler: (() -> Void)
//}
//
//class SwitchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    private let tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)//自作のSettingTableViewCellを利用
//        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
//        return table
//    }()
//    
//    var models = [Section]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configure()
//        title = "Setting"
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = view.bounds
//    }
//
//    func configure() {
//        models.append(Section(title: "General", options: [
//            .switchCell(model: SettingSwitchOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink, isOn: false) {
//                print("Tapped Switching cell")
//            })
//        ]))
//
//        models.append(Section(title: "General", options: [
//            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                print("Tapped first cell")
//            }),
//            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                if let url = URL(string: "https://www.hackingwithswift.com") {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                }
//            }),
//            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            }),
//            
//            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            })
//        ]))
//        
//        models.append(Section(title: "Information", options: [
//            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                print("Tapped first cell")
//            }),
//            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                
//            }),
//            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            }),
//            
//            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            })
//        ]))
//
//        models.append(Section(title: "Apps", options: [
//            .staticCell(model: SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                print("Tapped first cell")
//            }),
//            .staticCell(model: SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                
//            }),
//            .staticCell(model: SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            }),
//            
//            .staticCell(model: SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            })
//        ]))
//
//    }
//    
//    //MARK: - TableView Methods
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = models[section]
//        return section.title
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return models.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models[section].options.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = models[indexPath.section].options[indexPath.row]
//        
//        switch model.self {
//        case .staticCell(let model):
//            guard let cell = tableView.dequeueReusableCell(
//                    withIdentifier: SettingTableViewCell.identifier,
//                    for: indexPath
//            ) as? SettingTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.configure(with: model)
//            return cell
//
//        case .switchCell(let model):
//            guard let cell = tableView.dequeueReusableCell(
//                    withIdentifier: SwitchTableViewCell.identifier,
//                    for: indexPath
//            ) as? SwitchTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.configure(with: model)
//            return cell
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // action when cell was tapped
//        tableView.deselectRow(at: indexPath, animated: true)
//        let type = models[indexPath.section].options[indexPath.row]
//        switch type.self {
//        case .staticCell(let model):
//            model.handler()
//        case .switchCell(let model):
//            model.handler()
//        }
//    }
//    
//}
//
//
