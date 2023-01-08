//
//  MVVMMainViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

class MVVMMainVC: UIViewController {
    
    private let tableView = UITableView()
    private let cell = MVVMMainCell()
    
    private var viewModel: MVVMMainVCViewModelProtocol? {
        didSet {
            viewModel?.fetchObjects {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MVVMMainVCViewModel()
        instanceTableView()
    }
    
    //MARK: - InstanceTableView
    
    private func instanceTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MVVMMainCell.self, forCellReuseIdentifier: "cell")
    }
}

  
extension MVVMMainVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                    for: indexPath) as? MVVMMainCell {
            cell.backgroundColor = UIColor.lightGray
            cell.selectionStyle = .none
            cell.viewModel = viewModel?.instanceCellViewModel(indexPath: indexPath)
                  
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MVVMDetailVC()
        vc.viewModel = viewModel?.instanceDetailViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
