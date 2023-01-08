//
//  ViperMainViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

//MARK: - Protocols

protocol VIPERMainVCInputProtocol: AnyObject {
    func update(section: VIPERMainSectionRepresentable)
}

protocol VIPERMainVCOutputProtocol {
    init(view: VIPERMainVCInputProtocol)
    func viewDidLoad()
    func didTapCell(indexPath: IndexPath)
}

//MARK: - Initialization

class VIPERMainVC: UIViewController {
    
    private let tableView = UITableView()
    private let cell = VIPERMainCell()
    
    var presenter: VIPERMainVCOutputProtocol?
    private var section: VIPERMainSectionRepresentable = VIPERMainSectionViewModel()
    private let configurator: VIPERMainVCConfiguratorInputProtocol = VIPERMainVCConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        instanceTableView()
        presenter?.viewDidLoad()
    }
    
    //MARK: - InstanceTableView
    
    private func instanceTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(VIPERMainCell.self, forCellReuseIdentifier: "cell")
    }
}

extension VIPERMainVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = section.rows[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID,
                                                    for: indexPath) as? VIPERMainCell {
            
            cell.viewModel = viewModel
            cell.backgroundColor = UIColor.lightGray
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didTapCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = section.rows[indexPath.row]
        return viewModel.cellHeight
    }
}

//MARK: - InputProtocol

extension VIPERMainVC: VIPERMainVCInputProtocol {
    func update(section: VIPERMainSectionRepresentable) {
        self.section = section
        self.tableView.reloadData()
    }
}
