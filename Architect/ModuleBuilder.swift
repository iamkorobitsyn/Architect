//
//  ModuleBuilder.swift
//  Architect
//
//  Created by Александр Коробицын on 02.07.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class moduleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkServicce()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
