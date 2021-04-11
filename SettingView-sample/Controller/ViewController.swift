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
//    let options: [SettingOption]
//}
//
//struct SettingOption {
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    let handler: (() -> Void)
//}
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    private let tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
////        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)//自作のSettingTableViewCellを利用
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
//            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                print("Tapped first cell")
//            },
//            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                
//            },
//            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            },
//            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            }
//        ]))
//        
//        models.append(Section(title: "Information", options: [
//            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                
//            },
//            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                
//            },
//            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            },
//            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            }
//        ]))
//
//        models.append(Section(title: "Apps", options: [
//            SettingOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
//                
//            },
//            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
//                
//            },
//            SettingOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//                
//            },
//            SettingOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
//                
//            }
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
//        guard let cell = tableView.dequeueReusableCell(
//                withIdentifier: SettingTableViewCell.identifier,
//                for: indexPath
//        ) as? SettingTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.configure(with: model)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // action when cell was tapped
//        tableView.deselectRow(at: indexPath, animated: true)
//        let model = models[indexPath.section].options[indexPath.row]
//        model.handler()
//        //print(indexPath.row)
//    }
//    
//}
//
