//
//  ContactListRouter.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 20/10/22.
//

import UIKit

enum ContactListNavigationItem {
    case details(_ name: String)
}

protocol ContactListRouterProtocol {
    func navigate(to item: ContactListNavigationItem)
}

final class ContactListRouter: ContactListRouterProtocol {
    var viewController: UIViewController?
    
    func navigate(to item: ContactListNavigationItem) {
        switch item {
        case let .details(name):
            let detailsViewController = ConatactDetailsFactory.build(name: name)
            viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
