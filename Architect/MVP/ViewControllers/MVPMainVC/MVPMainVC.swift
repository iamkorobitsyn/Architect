//
//  ViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

protocol MVPMainVCProtocol: AnyObject {
    func prepareData(numberOfRows: Int,
                     userData: [MVPUser])
}

class MVPMainVC: UIViewController {
    
    private let tableView = UITableView()
    private let cell = MVPMainCell()
    
    var presenter: MVPMainVCPresenterProtocol? {
        didSet {
            presenter?.fetchObjects {
                self.tableView.reloadData()
            }
        }
    }
    
    private var numberOfRows: Int = 0
    private var userData: [MVPUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MVPMainVCPresenter(view: self)
        instanceTableView()
    }
    
    //MARK: - InstanceTableView
    
    private func instanceTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MVPMainCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension MVPMainVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                    for: indexPath) as? MVPMainCell {
            cell.backgroundColor = UIColor.lightGray
            cell.selectionStyle = .none
            cell.presenter = MVPMainCellPresenter(user: userData[indexPath.row],
                                                  view: cell)
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MVPDetailVC()
        vc.presenter = MVPDetailPresenter(user: userData[indexPath.row],
                                          view: vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension MVPMainVC: MVPMainVCProtocol {
    func prepareData(numberOfRows: Int,
                     userData: [MVPUser]) {
        self.numberOfRows = numberOfRows
        self.userData = userData
    }
}
