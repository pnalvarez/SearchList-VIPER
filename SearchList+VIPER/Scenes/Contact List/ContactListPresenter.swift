//
//  ContactListPresenter.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 20/10/22.
//

import UIKit

protocol ContactListPresenterInput {
    func viewWillAppear()
    func didTypePrefix(_ input: String)
    func setupTableViewProtocols(_ tableView: UITableView)
}

protocol ContactListPresenterOutput: AnyObject {
    func updateUI()
}

final class ContactListPresenter: NSObject, ContactListPresenterInput {
    private let interactor: ContactListInteractorInput
    private let router: ContactListRouterProtocol
    weak var view: ContactListPresenterOutput?
    
    private var contacts: [ContactListViewModel] = [] {
        didSet {
            view?.updateUI()
        }
    }
    
    init(interactor: ContactListInteractorInput, router: ContactListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear() {
        interactor.fetchContacts()
    }
    
    func didTypePrefix(_ input: String) {
        interactor.searchContact(withPrefix: input)
    }
    
    func setupTableViewProtocols(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ContactListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactListTableViewCell.self),
                                                 for: indexPath) as! ContactListTableViewCell
        cell.setupContent(contacts[indexPath.row])
        return cell
    }
}

extension ContactListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigate(to: .details(contacts[indexPath.row].name))
    }
}

extension ContactListPresenter: ContactListInteractorOutput {
    func didFetchContacts(_ contacts: [ContactListEntity]) {
        self.contacts = contacts.map({ ContactListViewModel(name: $0.name,
                                                            image: UIImage(named: $0.image)) })
    }
}


