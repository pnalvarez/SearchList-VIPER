//
//  ContactDetailsPresenter.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 25/10/22.
//

import UIKit

protocol ContactDetailsPresenterInput {
    var details: ContactDetailsViewModel? { get }
    var hasError: Bool { get }
    func viewWillAppear()
    func errorView() -> ErrorView
}

protocol ContactDetailsPresenterOutput: AnyObject {
    func updateUI()
}

final class ContactDetailsPresenter: ContactDetailsPresenterInput {
    private enum Strings {
        static let errorTitle = "An error ocurred"
        static let errorMessage = "Please, try again later"
        static let nameFormat = "Name: %@"
        static let numberFormat = "Phone number: %@"
        static let fromFormat = "Is from: %@"
    }
    private let name: String
    private let interactor: ContactDetailsInteractorInput
    weak var view: ContactDetailsPresenterOutput?
    
    var details: ContactDetailsViewModel? {
        didSet {
            view?.updateUI()
        }
    }
    
    var hasError: Bool = false {
        didSet {
            view?.updateUI()
        }
    }
    
    init(interactor: ContactDetailsInteractorInput, name: String) {
        self.interactor = interactor
        self.name = name
    }
    
    func viewWillAppear() {
        interactor.fetchDetails(name)
    }
    
    func errorView() -> ErrorView {
        let view = ErrorView(title: Strings.errorTitle, message: Strings.errorMessage, frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension ContactDetailsPresenter: ContactDetailsInteractorOutput {
    func didFetchDetails(_ model: ContactDetailsEntity) {
        details = ContactDetailsViewModel(name: String(format: Strings.nameFormat, model.name),
                                            image: UIImage(named: model.image),
                                            number: String(format: Strings.numberFormat, model.number),
                                            from: String(format: Strings.fromFormat, model.from))
    }
    
    func didGetError() {
        hasError = true
    }
}
