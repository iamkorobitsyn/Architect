//
//  CleanSwiftMainViewController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

class CleanSwiftMainVC: UIViewController {
    
    private let tableView = UITableView()
    private let cell = CleanSwiftMainCell()
    private var objects: CleanSwiftFetchObjects?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceTableView()
        fetch()
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
    
    //MARK: - Fetch Objects
    
    private func fetch() {
        CleanSwiftNetworkManager.instance.fetchData(dataType: CleanSwiftFetchObjects.self,
                                          url: CleanSwiftNetworkManager.instance.api) { result in
            switch result {
            case.success(let objects):
                DispatchQueue.main.async {
                    self.objects = objects
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}

extension CleanSwiftMainVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                    for: indexPath) as? CleanSwiftMainCell {
            cell.backgroundColor = UIColor.lightGray
            cell.selectionStyle = .none
                  
            if let objects = objects {
                
                let text = "\(objects.users[indexPath.row].firstName) \(objects.users[indexPath.row].lastName)"
                cell.nameSurename.text = text
                
                CleanSwiftNetworkManager.instance.fetchImage(url: objects.users[indexPath.row].image) { result in
                    switch result {
                    case.success(let image):
                        cell.photo.image = UIImage(data: image)
                    case.failure(let error):
                        print(error)
                    }
                }
                
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CleanSwiftDetailVC()
        vc.object = objects?.users[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
