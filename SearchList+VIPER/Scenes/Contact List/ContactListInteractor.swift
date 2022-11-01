//
//  ContactListInteractor.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 20/10/22.
//
import Foundation

protocol ContactListInteractorInput{
    func fetchContacts()
    func searchContact(withPrefix prefix: String)
}

protocol ContactListInteractorOutput: AnyObject {
    func didFetchContacts(_ contacts: [ContactListEntity])
}

final class ContactListInteractor: ContactListInteractorInput {
    private var contacts: [ContactListEntity] = []
    weak var presenter: ContactListInteractorOutput?
    
    func fetchContacts() {
        contacts = ContactListEntity.stub
        presenter?.didFetchContacts(contacts)
    }
    
    func searchContact(withPrefix prefix: String) {
        let filtered = contacts.filter({ $0.name.hasPrefix(prefix)})
        presenter?.didFetchContacts(filtered)
    }
}

