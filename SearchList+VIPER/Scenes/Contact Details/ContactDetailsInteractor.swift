//
//  ContactDetailsInteractor.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 25/10/22.
//

protocol ContactDetailsInteractorInput {
    func fetchDetails(_ name: String)
}

protocol ContactDetailsInteractorOutput: AnyObject {
    func didFetchDetails(_ model: ContactDetailsEntity)
    func didGetError()
}

final class ContactDetailsInteractor: ContactDetailsInteractorInput {
    weak var presenter: ContactDetailsInteractorOutput?
    private let dict: [String : ContactDetailsEntity] = ["Buffalo" : .init(name: "Buffalo", image: "buffalo",
                                                                           number: "+1 3907303", from: "School"),
                                                         "Cheetah" : .init(name: "Cheetah", image: "cheetah",
                                                                           number: "+1 3920", from: "My cousin"),
                                                         "Elephant" : .init(name: "Elephant", image: "elephant", number: "+1 28630", from: "Gym"),
                                                         "Giraffe" : .init(name: "Giraffe", image: "giraffe", number: "+1 38622", from: "College"),
                                                         "Gorilla": .init(name: "Gorilla", image: "gorilla", number: "+1 3863002", from: "Playing online"),
                                                         "Hippo" : .init(name: "Hippo", image: "hippo", number: "+1 83703", from: "I don't remember"),
                                                         "Lion" : .init(name: "Lion", image: "lion", number: "+1 29023", from: "Gym")]
    
    func fetchDetails(_ name: String) {
        guard let details = dict[name] else {
            presenter?.didGetError()
            return
        }
        presenter?.didFetchDetails(details)
    }
}
