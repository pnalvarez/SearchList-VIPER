//
//  ContactDetailsFactory.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 26/10/22.
//

enum ConatactDetailsFactory {
    static func build(name: String) -> ContactDetailsViewController {
        let interactor = ContactDetailsInteractor()
        let presenter = ContactDetailsPresenter(interactor: interactor, name: name)
        let viewController = ContactDetailsViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
