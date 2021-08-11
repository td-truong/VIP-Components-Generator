//
//  MODULE_PLACEHOLDERInteractor.swift
//  MODULE_PROJECT_NAME
//
//  Created by MODULE_AUTHOR on MODULE_DATE.
//

import Foundation

protocol MODULE_PLACEHOLDERInteractorProtocol {
    var presenter: MODULE_PLACEHOLDERPresenterProtocol { get }
}

class MODULE_PLACEHOLDERInteractor: MODULE_PLACEHOLDERInteractorProtocol {
    
    let presenter: MODULE_PLACEHOLDERPresenterProtocol
    
    init(presenter: MODULE_PLACEHOLDERPresenterProtocol) {
        self.presenter = presenter
    }
    
}
