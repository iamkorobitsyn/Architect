//
//  CleanSwiftMainVCRouter.swift
//  Architect
//
//  Created by Александр Коробицын on 10.01.2023.
//

import UIKit

@objc protocol CleanSwiftMainVCListRoutingLogic {
//    func routeToDetailVC(segue: UIStoryboardSegue?)
    func routeToDetailVC(indexPath: IndexPath)
}

protocol CleanSwiftMainVCDataPassing {
    var dataStore: CleanSwiftMainVCDataStore? { get }
}

class CleanSwiftMainVCRouter: NSObject, CleanSwiftMainVCListRoutingLogic, CleanSwiftMainVCDataPassing {
    
    weak var viewController: CleanSwiftMainVC?
    var dataStore: CleanSwiftMainVCDataStore?
    
    var users: [CleanSwiftUser] = []
    
    func routeToDetailVC(indexPath: IndexPath) {
        let destinationVC = CleanSwiftDetailVC()
        guard let dataStore = dataStore else {return}
        destinationVC.router?.dataStore?.user = dataStore.users[indexPath.row]
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
        
        print(dataStore.users.count)
    }
    
    

    // MARK: SegueRoutingExamle

//    func routeToDetailVC(segue: UIStoryboardSegue?) {
//        if let segue = segue {
//            let destinationVC = segue.destination as! CleanSwiftDetailVC
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
//        } else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "CourseDetailsViewController") as! CourseDetailsViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
//            navigateToCourseDetails(source: viewController!, destination: destinationVC)
//        }
//    }

    // MARK: StoryboardNavigationExample

//    func navigateToCourseDetails(source: CleanSwiftMainVC, destination: CleanSwiftDetailVC) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: SeguePassingdataExample

//    func passDataToCourseDetails(source: CleanSwiftMainVC, destination: inout CleanSwiftDetailVC) {
//        guard let indexPath = viewController?.tableView.indexPathForSelectedRow else {return}
//        destination.user = source.rows[indexPath.row]
//    }
    
}
