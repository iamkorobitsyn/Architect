//
//  CleanSwiftMainViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022
//

import UIKit

protocol CleanSwiftMainVCDisplayLogic: AnyObject {
    func displayMainVC(display: MainVC.ShowUsers.ViewModel)
}

class CleanSwiftMainVC: UIViewController {
    
    var interactor: CleanSwiftMainVCBuisnessLogic?
    var router: CleanSwiftMainVCRouter?
    
    private let tableView = UITableView()
    private let cell = CleanSwiftMainCell()
    private var rows: [CellIdentifiable] = []
//    var router: (NSObjectProtocol & CleanSwiftMainVCListRoutingLogic & CleanSwiftMainVCDataPassing)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CleanSwiftMainVCConfigurator.instance.configure(viewController: self)
        interactor?.fetchUsers()
        instanceTableView()
        
    }
    
    //MARK: - InstanceTableView
    
    private func instanceTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CleanSwiftMainCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - SegueRoutingExample
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let scene = segue.identifier {
//            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
//        }
//    }
}

extension CleanSwiftMainVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: rows[indexPath.row].identifire,
                                                    for: indexPath) as? CleanSwiftMainCell {
            cell.viewModel = rows[indexPath.row]
            cell.backgroundColor = UIColor.lightGray
            cell.selectionStyle = .none
                  
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetailVC(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension CleanSwiftMainVC: CleanSwiftMainVCDisplayLogic {
    func displayMainVC(display: MainVC.ShowUsers.ViewModel) {
        self.rows = display.rows
        self.tableView.reloadData()
    }
    
    
}
