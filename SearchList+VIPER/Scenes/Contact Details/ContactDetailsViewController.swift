//
//  ContactDetailsViewController.swift
//  SearchList+VIPER
//
//  Created by Pedro Alvarez on 26/10/22.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fromLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var errorView: ErrorView = presenter.errorView()
    
    private let presenter: ContactDetailsPresenterInput
    
    init(presenter: ContactDetailsPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(stackView)
        view.addSubview(errorView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(fromLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: stackView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    
        view.backgroundColor = .white
        
        setupContent()
    }
    
    private func setupContent() {
        errorView.isHidden = !presenter.hasError
        imageView.image = presenter.details?.image
        nameLabel.text = presenter.details?.name
        numberLabel.text = presenter.details?.number
        fromLabel.text = presenter.details?.from
    }
}

extension ContactDetailsViewController: ContactDetailsPresenterOutput {
    func updateUI() {
        setupContent()
    }
}
