//
//  MODULE_PLACEHOLDERRouter.swift
//  MODULE_PROJECT_NAME
//
//  Created by MODULE_AUTHOR on MODULE_DATE.
//

import UIKit

protocol MODULE_PLACEHOLDERRouterProtocol {
    static func create() -> UIViewController
}

class MODULE_PLACEHOLDERRouter: MODULE_PLACEHOLDERRouterProtocol {
    
    class func create() -> UIViewController {
        let router = MODULE_PLACEHOLDERRouter()
        let presenter = MODULE_PLACEHOLDERPresenter()
        let interactor = MODULE_PLACEHOLDERInteractor(presenter: presenter)
        let view = MODULE_PLACEHOLDERController(interactor: interactor, router: router)
        presenter.view = view
        return view
    }
    
}
