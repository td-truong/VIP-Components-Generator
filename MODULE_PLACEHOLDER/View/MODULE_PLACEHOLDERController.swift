//
//  MODULE_PLACEHOLDERController.swift
//  MODULE_PROJECT_NAME
//
//  Created by MODULE_AUTHOR on MODULE_DATE.
//

import UIKit

protocol MODULE_PLACEHOLDERViewProtocol: AnyObject {
    var interactor: MODULE_PLACEHOLDERInteractorProtocol! { get }
    var router: MODULE_PLACEHOLDERRouterProtocol! { get }
}

class MODULE_PLACEHOLDERController: UIViewController, MODULE_PLACEHOLDERViewProtocol {
    
    let interactor: MODULE_PLACEHOLDERInteractorProtocol!
    let router: MODULE_PLACEHOLDERRouterProtocol!
    
    init(interactor: MODULE_PLACEHOLDERInteractorProtocol, router: MODULE_PLACEHOLDERRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

